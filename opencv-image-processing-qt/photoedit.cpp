#include "photoedit.h"
#include "brightnessandcontrast.h"
#include "gammatransformation.h"
#include "hsv.h"
#include "cutting.h"
#include "addtext.h"
#include "filter.h"
#include "Req.h"
#include <QTextCodec>
#include <QQmlApplicationEngine>
#include "blurs.h"
using namespace cv;

string path, demo_pic;
string Source, RootSrc, Src, Current;
QString str2qstr(const string str){
    return QString::fromLocal8Bit(str.data());
}
string qstr2str(const QString qstr){
    QByteArray cdata = qstr.toLocal8Bit();
    return string(cdata);
}
void path_init(QString pwd){
    path = qstr2str(pwd) + "/";
    demo_pic = path + "demo_pic.png";
}
PhotoEdit::PhotoEdit(QObject *parent) : QObject(parent){
    path_init(QCoreApplication::applicationDirPath());
}
string Gets(QString input){
    string s = qstr2str(input);
    if(s.size() > 8 && s.substr(0, 8) == "file:///") s = s.substr(8, s.size() - 8);
    return s;
}
QString PhotoEdit::init(QString input){//读入原图像，返回缩小 1/4 的图像
    Source = Gets(input);
    if(Source == "") Source = demo_pic;
    Mat src = imread(Source);
    cout << Source << '\n';
    if(!src.data){
        cout << "Fuck in init\n";
        return input;
    }
    resize(src, src, Size(), 0.5, 0.5);
    RootSrc = path + "Rootsrc.jpg", Src = path + "src.jpg", Current = path + "Current.jpg";
    imwrite(RootSrc, src);
    imwrite(Src, src);
    imwrite(Current, src);
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::reset(){
    Mat src;
    src = imread(RootSrc);
    imwrite(Src, src);
    imwrite(Current, src);
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::getSource(){
    return QString("file:///" + QString::fromStdString(Src));
}
QString PhotoEdit::setExposure(QString input, int alpha){
    string s = Gets(input);
    Mat src = imread(s), dst;
    if(!src.data){
        cout << -1 << "\n";
        return QString("file:///" + QString::fromStdString(Current));
    }
    adjustExposure(src, dst);
    Mat mix;
    addWeighted(dst, 1.0 * alpha / 100, src, 1.0 * (100 - alpha) / 100, 0.0, mix);
    imwrite(Current, mix);
    imwrite(Src, mix);
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::edit(QString input){
    string s = Gets(input);
    QString qs;
    Mat src = imread(s), dst;
    if(!src.data){
        cout << -1 << " Fail to find the image\n";
        return QString("file:///" + QString::fromStdString(Current));
    }
    s = Src;//在初始图片基础上修改
    src = imread(s);
    adjustBrightnessAndContrast(src, dst, CurrentBrightness, CurrentContrast);//亮度对比度调节
    adjustHSV(dst, dst, CurrentHue, CurrentSaturation, CurrentValue);//色相饱和度调节
    imwrite(Current, dst);//只修改当前图片
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::cut(QString input, int x, int y, int a, int b){
    string s = Gets(input);
    Mat src = imread(s), dst;
    if(!src.data){
        cout << -1 << "\n";
        return QString("file:///" + QString::fromStdString(Current));
    }
    int row = src.rows, col = src.cols;
    auto chk = [&](int a, int b, int c, int d){
        return a * d > b * c;
    };
    if(chk(col, row, 871, 620)){
        x = x * col / 871;
        y = y * col / 871;
        a = a * col / 871;
        b = b * col / 871;
    }
    else{
        x = x * row / 620;
        y = y * row / 620;
        a = a * row / 620;
        b = b * row / 620;
    }
    Point p1(x, y), p2(a, b);
    Rect rect(p1, p2);
    imageCrop(src, dst, rect);
    imwrite(Current, dst);
    imwrite(Src, dst);
    return QString("file:///" + QString::fromStdString(Current));
}

QString PhotoEdit::rotate(QString input, int type){
    string s = Gets(input);
    Mat src = imread(s), dst;
    cv::rotate(src, dst, 0);
    if(type == 1) cv::rotate(dst, dst, 0), cv::rotate(dst, dst, 0);
    imwrite(Current, dst);
    imwrite(Src, dst);
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::showMagnitude(QString input){
    string s = Gets(input);
    QString qs;
    Mat src = imread(s, 0), dst;
    dst = show_magnitude(src);
    imwrite(Current, dst);
    imwrite(Src, dst);
    return QString("file:///" + QString::fromStdString(Current));
}
void PhotoEdit::save(QString input, QString location, QString name){
   string s1 = Gets(input), s2 = Gets(location), s3 = Gets(name);
   Mat src = imread(s1);
   resize(src, src, Size(), 2, 2);
   s2 = s2 + "/" + s3 + ".jpg";
   cout << s2 << endl;
   imwrite(s2, src);
}

QString PhotoEdit::putText(QString input, QString text, int x, int y, int size, int B, int G, int R){
    string s1 = Gets(input), s2 = Gets(text);
    Mat dst = imread(s1);

    int row = dst.rows, col = dst.cols;
    auto chk = [&](int a, int b, int c, int d){
        return a * d > b * c;
    };
    if(chk(col, row, 871, 620)){
        x = x * col / 871;
        y = y * col / 871;
    }
    else{
        x = x * row / 620;
        y = y * row / 620;
    }
    Point P(x, y);
    Scalar sca(B, G, R);
    const char *p = s2.data();
    paDrawString(dst, p, P, sca, size, 0, 0);
    imwrite(Current, dst);
    imwrite(Src, dst);
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::filter(QString input, int a){//滤镜，a是种类
    if(a == 0) return reset();
    string s = Gets(input);
    Mat src = imread(s), dst;
    if(!src.data){
        cout << -1 << "\n";
        return QString("file:///" + QString::fromStdString(Current));
    }
    adjustFilter(src, dst, a);
    imwrite(Current, dst);//修改当前图
    imwrite(Src, dst);//修改初始图
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::req(QString input, int b){
    if(b == 0) return reset();
    string s = Gets(input);
    // 需要的是灰度图
    Mat src, dst;
    if(b == 1 || b == 2 || b == 6 || b == 8) src = imread(s, 0);
    // 原图
    else src = imread(s);
    if(!src.data){
        cout << -1 << "\n";
        return QString("file:///" + QString::fromStdString(Current));
    }
    Req1(src, dst, b);
    imwrite(Current, dst);
    imwrite(Src, dst);
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::gauss(QString input, int type){
    if(type == 0) return reset();
    string s = Gets(input);
    Mat src = imread(s), dst;
    if(type == 1) gauss_low_filt(src, dst, 70);//sigma = 70
    else if(type == 2) gauss_high_filt(src, dst, 70);//sigma = 70
    imwrite(Current, dst);
    imwrite(Src, dst);
    dst = imread(Current);
    return QString("file:///" + QString::fromStdString(Current));
}
QString PhotoEdit::recover(QString input, int type){
    if(type == 0) return reset();
    string s = Gets(input);
    Mat src = imread(s), dst;
    if(type == 1) inverse_filt(src, dst, 0.00005);//sigma = 0.00005
    else if(type == 2) venus_filt(src, dst, 0.00005);//sigma = 0.00005
    imwrite(Current, dst);
    imwrite(Src, dst);
    dst = imread(Current);
    return QString("file:///" + QString::fromStdString(Current));
}
void PhotoEdit::setCurrentBrightness(int x){
    CurrentBrightness = x;
}

void PhotoEdit::setCurrentContrast(int x){
    CurrentContrast = x;
}

void PhotoEdit::setCurrentSaturation(int x){
    CurrentSaturation = x;
}

void PhotoEdit::setCurrentHue(int x){
    CurrentHue = x;
}

void PhotoEdit::setCurrentValue(int x){
    CurrentValue = x;
}
int PhotoEdit::getCurrentBrightness(){
    return CurrentBrightness;
}

int PhotoEdit::getCurrentContrast(){
    return CurrentContrast;
}

int PhotoEdit::getCurrentHue(){
    return CurrentHue;
}

int PhotoEdit::getCurrentSaturation(){
    return CurrentSaturation;
}

int PhotoEdit::getCurrentValue(){
    return CurrentValue;
}

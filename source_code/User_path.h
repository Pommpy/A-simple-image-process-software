#ifndef USER_PATH_H
#define USER_PATH_H

#endif // USER_PATH_H

#include <QObject>
#include <QTextCodec>
using namespace std;

string path;
string demo_pic;
string qstr2str(const QString qstr){
    QByteArray cdata = qstr.toLocal8Bit();
    return string(cdata);
}
void path_init(QString pwd){
    path = qstr2str(pwd);
    demo_pic = path + "/" + "demo_pic.png";
}

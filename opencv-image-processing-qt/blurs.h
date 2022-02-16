#include <bits/stdc++.h>
#include <opencv2/opencv.hpp>
using namespace std;
using namespace cv;


//频率域滤波


#ifndef BLURS_H
#define BLURS_H
Mat Magnitude(Mat& complexI) {//显示傅立叶变换后的频谱图
    vector<Mat> planes;
    split(complexI, planes);//分离实部和虚部
    magnitude(planes[0], planes[1], planes[0]);//得到幅值（即能量或者密度），储存在 planes[0] 中
    planes[0] += Scalar::all(1);
    log(planes[0], planes[0]);//为了方便显示，把 v 转化成 log(1 + v)
    normalize(planes[0], planes[0], 0, 255, NORM_MINMAX);//归一化
    return planes[0];
}
void fftshift(Mat& src) {//把低频分量移到中心
    int cx = src.cols / 2;
    int cy = src.rows / 2;
    Mat q0(src, Rect(0, 0, cx, cy));   // ROI区域的左上
    Mat q1(src, Rect(cx, 0, cx, cy));  // ROI区域的右上
    Mat q2(src, Rect(0, cy, cx, cy));  // ROI区域的左下
    Mat q3(src, Rect(cx, cy, cx, cy)); // ROI区域的右下
    //交换象限（左上与右下进行交换）
    Mat tmp;
    q0.copyTo(tmp);
    q3.copyTo(q0);
    tmp.copyTo(q3);
    //交换象限（右上与左下进行交换）
    q1.copyTo(tmp);
    q2.copyTo(q1);
    tmp.copyTo(q2);
}
Mat DFT(const Mat& src) {//对原矩阵进行 DFT，得到复数矩阵
    vector<Mat> planes = { src.clone(), Mat::zeros(src.size(), CV_32FC1) };//实部和虚部
    Mat complexI;
    merge(planes, complexI);//合并为双通道复数矩阵
    dft(complexI, complexI);//dft后的矩阵，仍然是双通道复数矩阵
    fftshift(complexI);//把低频分量移到中心
    return complexI;
}
Mat show_magnitude(Mat& src){
    int n = getOptimalDFTSize(src.rows), m = getOptimalDFTSize(src.cols);//获取最优的 dft 尺寸
    Mat padded;//填充矩阵
    copyMakeBorder(src, padded, 0, n - src.rows, m - src.cols, BORDER_CONSTANT, 0); //padded 是 src 填充 0 之后的结果，尺寸为 (n, m)
    padded.convertTo(padded, CV_32FC1);//把 padded 转化成 float 类型
    Mat complexI = DFT(padded);//对 padded 进行 DFT，得到一个双通道的复数矩阵，第一维为实部，第二维为虚部
    return Magnitude(complexI);
}
void gauss_low_filt_single(Mat& src, Mat& dst, double sigma) {
    int n = getOptimalDFTSize(src.rows), m = getOptimalDFTSize(src.cols);//获取最优的 dft 尺寸
    double D0 = 2 * sigma * sigma;
    Mat padded;//填充矩阵
    copyMakeBorder(src, padded, 0, n - src.rows, m - src.cols, BORDER_CONSTANT, 0); //padded 是 src 填充 0 之后的结果，尺寸为 (n, m)
    padded.convertTo(padded, CV_32FC1);//把 padded 转化成 float 类型
    Mat complexI = DFT(padded);//对 padded 进行 DFT，得到一个双通道的复数矩阵，第一维为实部，第二维为虚部
    vector<Mat> planes;
    split(complexI, planes);//分解成实部和虚部
    auto gauss_low_filter = [&](Size size, double D0) {//得到高斯低通滤波的卷积核（频率域）
        Mat kernel(size, CV_32FC1);
        int n = kernel.rows, m = kernel.cols;
        double cr = n / 2, cc = m / 2;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                double d = (i - cr) * (i - cr) + (j - cc) * (j - cc);
                kernel.at<float>(i, j) = expf(-d / D0);
            }
        }
        return kernel;
    };
    Mat kernel = gauss_low_filter(padded.size(), D0);
    for (auto& plane: planes) multiply(plane, kernel, plane);//时域的卷积等于频率域的乘积
    merge(planes, complexI);//把实部和虚部合并回双通道的复数矩阵
    fftshift(complexI);//把shift了的矩阵挪回去
    idft(complexI, complexI);//进行 idft
    split(complexI, planes);//分解成实部和虚部，为了获取幅值
    magnitude(planes[0], planes[1], planes[0]);//得到幅值，保存在 planes[0]
    normalize(planes[0], dst, 0, 255, NORM_MINMAX);//归一化
    dst = dst(Rect(0, 0, src.cols, src.rows));//把尺寸变回原本图像
}
void gauss_high_filt_single(Mat& src, Mat& dst, double sigma) {
    int n = getOptimalDFTSize(src.rows), m = getOptimalDFTSize(src.cols);
    double D0 = 2 * sigma * sigma;
    Mat padded;
    copyMakeBorder(src, padded, 0, n - src.rows, m - src.cols, BORDER_CONSTANT, 0);
    padded.convertTo(padded, CV_32FC1);
    Mat complexI = DFT(padded);
    vector<Mat> planes;
    split(complexI, planes);
    auto gauss_high_filter = [&](Size size, double D0) {
        Mat kernel(size, CV_32FC1);
        int n = kernel.rows, m = kernel.cols;
        double cr = n / 2, cc = m / 2;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                double d = (i - cr) * (i - cr) + (j - cc) * (j - cc);
                kernel.at<float>(i, j) = 1 - expf(-d / D0);
            }
        }
        return kernel;
    };
    Mat kernel = gauss_high_filter(padded.size(), D0);
    for (auto& plane : planes) multiply(plane, kernel, plane);
    merge(planes, complexI);
    fftshift(complexI);
    idft(complexI, complexI);
    split(complexI, planes);
    magnitude(planes[0], planes[1], planes[0]);
    normalize(planes[0], dst, 0, 255, NORM_MINMAX);
    dst = dst(Rect(0, 0, src.cols, src.rows));
}
void gauss_low_filt(Mat& src, Mat& dst, double sigma) {//高斯低通滤波
    waitKey(0);
    vector<Mat> channels;
    split(src, channels);//把三通道分离
    for (auto& channel : channels) gauss_low_filt_single(channel, channel, sigma);//每个通道单独滤波
    merge(channels, dst);//把三通道合并
    dst = dst(Rect(0, 0, src.cols, src.rows));
}
void gauss_high_filt(Mat& src, Mat& dst, double sigma) {
    vector<Mat> channels;
    split(src, channels);//分离通道
    for (auto& channel : channels) gauss_high_filt_single(channel, channel, sigma);
    merge(channels, dst);
    dst = dst(Rect(0, 0, src.cols, src.rows));
}
void inverse_filt_single(Mat& src, Mat& dst, double k) {
    int n = getOptimalDFTSize(src.rows), m = getOptimalDFTSize(src.cols);
    Mat padded;
    copyMakeBorder(src, padded, 0, n - src.rows, m - src.cols, BORDER_CONSTANT, 0);
    padded.convertTo(padded, CV_32FC1);
    Mat complexI = DFT(padded);
    vector<Mat> planes;
    split(complexI, planes);
    auto inverse_filter = [&](Size size, double k) {
        Mat kernel(size, CV_32FC1);
        int n = kernel.rows, m = kernel.cols;
        double cr = n / 2, cc = m / 2;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                double d = (i - cr) * (i - cr) + (j - cc) * (j - cc);
                //cout << -k * pow(d, 5.0 / 6) << '\n';
                kernel.at<float>(i, j) = expf(-k * pow(d, 5.0 / 6));
            }
        }
        return kernel;
    };
    Mat kernel = inverse_filter(complexI.size(), k);
    for (auto& plane : planes) divide(plane, kernel, plane);
    merge(planes, complexI);
    fftshift(complexI);
    idft(complexI, complexI);
    split(complexI, planes);
    magnitude(planes[0], planes[1], planes[0]);
    normalize(planes[0], dst, 0, 255, NORM_MINMAX);
    dst = dst(Rect(0, 0, src.cols, src.rows));
}
void inverse_filt(Mat& src, Mat& dst, double k) {
    vector<Mat> channels;
    split(src, channels);
    for (auto& channel : channels) inverse_filt_single(channel, channel, k);
    merge(channels, dst);
    dst = dst(Rect(0, 0, src.cols, src.rows));
}
void venus_filt_single(const Mat& src, Mat& dst, double k) {
    int n = getOptimalDFTSize(src.rows), m = getOptimalDFTSize(src.cols);
    Mat padded;
    copyMakeBorder(src, padded, 0, n - src.rows, m - src.cols, BORDER_CONSTANT, 0);
    padded.convertTo(padded, CV_32FC1);
    Mat complexI = DFT(padded);
    vector<Mat> planes;
    split(complexI, planes);
    auto inverse_filter = [&](Size size, double k) {
        Mat kernel(size, CV_32FC1);
        int n = kernel.rows, m = kernel.cols;
        double cr = n / 2, cc = m / 2;
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < m; j++) {
                double d = (i - cr) * (i - cr) + (j - cc) * (j - cc);
                double h = expf(-k * pow(d, 5.0 / 6));
                h = (h / (h * h + 3));
                kernel.at<float>(i, j) = h;
            }
        }
        return kernel;
    };
    Mat kernel = inverse_filter(complexI.size(), k);
    for (auto& plane : planes) divide(plane, kernel, plane);
    merge(planes, complexI);
    fftshift(complexI);
    idft(complexI, complexI);
    split(complexI, planes);
    magnitude(planes[0], planes[1], planes[0]);
    normalize(planes[0], dst, 0, 255, NORM_MINMAX);
    dst = dst(Rect(0, 0, src.cols, src.rows));
}
void venus_filt(const Mat& src, Mat& dst, double k) {
    vector<Mat> channels;
    split(src, channels);
    for (auto& channel : channels) venus_filt_single(channel, channel, k);
    merge(channels, dst);
    dst = dst(Rect(0, 0, src.cols, src.rows));
}
#endif

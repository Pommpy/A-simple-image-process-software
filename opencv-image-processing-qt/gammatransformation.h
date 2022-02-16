#ifndef GAMMATRANSFORMATION_H
#define GAMMATRANSFORMATION_H\


#include <iostream>
#include <fstream>
#include <cstring>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/highgui/highgui_c.h>
using namespace std;
const double gamma = 0.5;
void adjustExposure(const cv::Mat& src, cv::Mat& dst){//调节曝光度，gamma变换
    dst.create(src.size(), src.type());
    cv::Mat lookUpTable(1, 256, CV_8U);
    uchar *p = lookUpTable.data;
    for(int i = 0; i < 256; i++){
        double val = pow(1.0 * i / 255, gamma) * 255.0;
        if(val > 255) val = 255;
        else if(val < 0) val = 0;
        p[i] = int(val);
    }
    LUT(src, lookUpTable, dst);
}

#endif // GAMMATRANSFORMATION_H

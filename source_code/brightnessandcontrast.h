#ifndef BRIGHTNESSANDCONTRAST_H
#define BRIGHTNESSANDCONTRAST_H

#include <iostream>
#include <fstream>
#include <cstring>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/highgui/highgui_c.h>
using namespace std;

#define SWAP(a, b, t)  do { t = a; a = b; b = t; } while(0)
#define CLIP_RANGE(value, min, max)  ( (value) > (max) ? (max) : (((value) < (min)) ? (min) : (value)) )
#define COLOR_RANGE(value)  CLIP_RANGE(value, 0, 255)

void adjustBrightnessAndContrast(const cv::Mat& src, cv::Mat& dst, double brightness, double contrast)
{
    if (src.empty()){
        std::cout << "Can not find the file!\n";
        return;
    }
    brightness = CLIP_RANGE(brightness, -255, 255);
    contrast = CLIP_RANGE(contrast, -255, 255);
    /**
    Algorithm of Brightness Contrast transformation
    The formula is:
        y = [x - 127.5 * (1 - B)] * k + 127.5 * (1 + B);
        x is the input pixel value
        y is the output pixel value
        B is brightness, value range is [-1,1]
        k is used to adjust contrast
            k = tan( (45 + 44 * c) / 180 * PI );
            c is contrast, value range is [-1,1]*/
    const double pi = acos(-1.0);
    double B = brightness / 255.;
    double c = contrast / 255.;
    double k = tan((45 + 44 * c) / 180 * pi);

    cv::Mat lookupTable(1, 256, CV_8U);
    uchar *p = lookupTable.data;
    for (int i = 0; i < 256; i++) {
        int c = (i - 127.5 * (1 - B)) * k + 127.5 * (1 + B);
        p[i] = COLOR_RANGE(c);
    }
    LUT(src, lookupTable, dst);
}

#endif // BRIGHTNESSANDCONTRAST_H

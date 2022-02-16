#ifndef CUTTING_H
#define CUTTING_H

#include <iostream>
#include <fstream>
#include <cstring>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/highgui/highgui_c.h>
using namespace std;
void imageCrop(const cv::Mat& src, cv::Mat& dst, cv::Rect rect){//裁剪，传入对应的长方形
    if (src.empty()) return;
    cv::Rect srcRect(0, 0, src.cols, src.rows);
    rect = rect & srcRect;//取交
    if (rect.width <= 0 || rect.height <= 0) return;
    src(rect).copyTo(dst);
}

#endif // CUTTING_H

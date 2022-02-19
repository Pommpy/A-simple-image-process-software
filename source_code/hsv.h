//此文件包含调整图片HSV的函数（色度，对比度，亮度）
#ifndef HSV_H
#define HSV_H
#include <iostream>
#include <fstream>
#include <cstring>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/highgui/highgui_c.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
using namespace std;
void adjustHSV(cv::Mat& src, cv::Mat& dst, int Hue, int Saturation, int Value){
        if(src.empty()) return;
        dst.create(src.size(), src.type());
        cv::cvtColor(src, dst, CV_RGB2HSV);
        int hue = Hue - 255;
        int saturation = Saturation - 255;
        int value = Value - 255;
        for(int y = 0; y < dst.cols; y++)
        {
            for(int x = 0; x < dst.rows; x++)
            {
                int cur1 = dst.at<cv::Vec3b>(cv::Point(y,x))[0];
                int cur2 = dst.at<cv::Vec3b>(cv::Point(y,x))[1];
                int cur3 = dst.at<cv::Vec3b>(cv::Point(y,x))[2];
                cur1 += hue;
                cur2 += saturation;
                cur3 += value;

                if(cur1 < 0) cur1= 0; else if(cur1 > 255) cur1 = 255;
                if(cur2 < 0) cur2= 0; else if(cur2 > 255) cur2 = 255;
                if(cur3 < 0) cur3= 0; else if(cur3 > 255) cur3 = 255;

                dst.at<cv::Vec3b>(cv::Point(y,x))[0] = cur1;
                dst.at<cv::Vec3b>(cv::Point(y,x))[1] = cur2;
                dst.at<cv::Vec3b>(cv::Point(y,x))[2] = cur3;
            }
        }
        cvtColor(dst, dst, CV_HSV2RGB);
}
#endif // HSV_H

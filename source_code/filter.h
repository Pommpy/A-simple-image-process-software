#ifndef FILTER_H
#define FILTER_H

#include<opencv2/opencv.hpp>
#include<iostream>
#include <cmath>
#include <fstream>
#include <cstring>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/highgui/highgui_c.h>

using namespace std;

void adjustFilter(const cv::Mat &src, cv::Mat &dst, int a) {
    if (src.empty()) return;
    if (a == 0) {
        dst.create(src.size(), src.type());
    }

    //浮雕
    if (a == 1) {
        dst.create(src.size(), src.type());
        for (int y = 1; y < src.rows - 1; y++) {
            const uchar *p0 = src.ptr<uchar>(y);
            const uchar *p1 = src.ptr<uchar>(y + 1);
            uchar *q0 = dst.ptr<uchar>(y);
            for (int x = 1; x < src.cols - 1; x++) {
                for (int i = 0; i < 3; i++) {
                    int tmp0 = p1[3 * (x + 1) + i] - p0[3 * (x - 1) + i] + 128;//浮雕
                    if (tmp0 < 0) q0[3 * x + i] = 0;
                    else if (tmp0 > 255) q0[3 * x + i] = 255;
                    else q0[3 * x + i] = tmp0;
                }
            }
        }
    }
    //雕刻
    if (a == 2) {
        dst.create(src.size(), src.type());
        for (int y = 1; y < src.rows - 1; y++) {
            const uchar *p0 = src.ptr<uchar>(y);
            const uchar *p1 = src.ptr<uchar>(y + 1);
            uchar *q1 = dst.ptr<uchar>(y);
            for (int x = 1; x < src.cols - 1; x++) {
                for (int i = 0; i < 3; i++) {
                    int tmp1 = p0[3 * (x - 1) + i] - p1[3 * (x + 1) + i] + 128;//雕刻
                    if (tmp1 < 0)
                        q1[3 * x + i] = 0;
                    else if (tmp1 > 255)
                        q1[3 * x + i] = 255;
                    else
                        q1[3 * x + i] = tmp1;

                }

            }

        }
    }
    if (a == 3) {
        //怀旧色
        int width = src.cols;
        int heigh = src.rows;
        cv::RNG rng;
        cv::Mat img(src.size(), CV_8UC3);
        for (int y = 0; y < heigh; y++) {
            const uchar *P0 = src.ptr<uchar>(y);
            uchar *P1 = img.ptr<uchar>(y);
            for (int x = 0; x < width; x++) {
                float B = P0[3 * x];
                float G = P0[3 * x + 1];
                float R = P0[3 * x + 2];
                float newB = 0.272 * R + 0.534 * G + 0.131 * B;
                float newG = 0.349 * R + 0.686 * G + 0.168 * B;
                float newR = 0.393 * R + 0.769 * G + 0.189 * B;
                if (newB < 0)newB = 0;
                if (newB > 255)newB = 255;
                if (newG < 0)newG = 0;
                if (newG > 255)newG = 255;
                if (newR < 0)newR = 0;
                if (newR > 255)newR = 255;
                P1[3 * x] = (uchar) newB;
                P1[3 * x + 1] = (uchar) newG;
                P1[3 * x + 2] = (uchar) newR;
            }
        }
        dst = img;
    }
    if (a == 4) {
        //黑白滤镜
        cv::cvtColor(src, dst, CV_RGB2GRAY);
        cv::threshold(dst, dst, 128, 255, CV_THRESH_BINARY);
    }
    if (a == 5) {
        //褪色
        cv::Mat& img = dst;
        img = src.clone();
        for (size_t i = 0; i < img.rows; i++)
            {
                for (size_t j = 0; j < img.cols; j++)
                {
                    int Max = max(max(img.at<cv::Vec3b>(i, j)[0], img.at<cv::Vec3b>(i, j)[1]),img.at<cv::Vec3b>(i, j)[2]);

                    int Min = min(
                        min(img.at<cv::Vec3b>(i, j)[0], img.at<cv::Vec3b>(i, j)[1]),
                        img.at<cv::Vec3b>(i, j)[2]
                    );

                    for (size_t k = 0; k < 3; k++)
                    {
                        img.at<cv::Vec3b>(i, j)[k] = (Max + Min) / 2;
                    }

                }
            }

    }
    if (a == 6) {
        //羽化
        cv::Mat& img = dst;
        img = src.clone();
        if (img.empty()) return;

            // s2
        int center_x = img.cols >> 1;
        int center_y = img.rows >> 1;
        int s2 = center_x * center_x + center_y * center_y;

        // 宽长比例 ratio
        double ratio = img.cols > img.rows ? static_cast<double>(img.rows) / img.cols : static_cast<double>(img.cols) / img.rows;

        // mSize
        // 2、通过控制V值的大小实现范围控制。
        double mSize = 0.5;

        for (size_t i = 0; i < img.rows; i++)
        {
            for (size_t j = 0; j < img.cols; j++)
            {
                double dx = static_cast<double>(std::abs(center_x - static_cast<int>(j)));
                double dy = static_cast<double>(std::abs(center_y - static_cast<int>(i)));


                //4、s1 有根据 ratio 修正 dx dy值。
                if (center_x > center_y)
                {
                    dx = dx * ratio;
                }
                else
                {
                    dy = dx * ratio;
                }

                // s1
                double s1 = dx * dx + dy * dy;
                // v
                // 3、V = 255 * 当前点Point距中点距离的平方s1 / (顶点距中点的距离平方s2 * mSize);
                double v = 255 * s1 / (s2 * mSize);

                int b = img.at<cv::Vec3b>(i, j)[0];
                int g = img.at<cv::Vec3b>(i, j)[1];
                int r = img.at<cv::Vec3b>(i, j)[2];

                // 1、通过对rgb值增加额外的V值实现朦胧效果
                img.at<cv::Vec3b>(i, j)[0] = cv::saturate_cast<uchar>(b + v);
                img.at<cv::Vec3b>(i, j)[1] = cv::saturate_cast<uchar>(g + v);
                img.at<cv::Vec3b>(i, j)[2] = cv::saturate_cast<uchar>(r + v);
            }
        }
    }
    if (a == 7) {//素描
        int width=src.cols;
        int heigh=src.rows;
        cv::Mat gray0,gray1;
        //去色
        cvtColor(src,gray0,CV_BGR2GRAY);
        //反色
        addWeighted(gray0,-1,NULL,0,255,gray1);
        //高斯模糊,高斯核的Size与最后的效果有关
        GaussianBlur(gray1,gray1,cv::Size(11,11),0);

        //融合：颜色减淡
        cv::Mat img(gray1.size(),CV_8UC1);
        for (int y=0; y<heigh; y++)
        {

            uchar* P0  = gray0.ptr<uchar>(y);
            uchar* P1  = gray1.ptr<uchar>(y);
            uchar* P  = img.ptr<uchar>(y);
            for (int x=0; x<width; x++)
            {
                int tmp0=P0[x];
                int tmp1=P1[x];
                P[x] =(uchar) min((tmp0+(tmp0*tmp1)/(256-tmp1)),255);
            }

        }
        dst = img;
    }
    if(a == 8){
        //冰冻滤镜
        cv::Mat& img = dst;
        img = src.clone();
        for (size_t i = 0; i < img.rows; i++)
            {
                for (size_t j = 0; j < img.cols; j++)
                {
                    img.at<cv::Vec3b>(i, j)[0] = cv::saturate_cast<uchar>(std::abs(img.at<cv::Vec3b>(i, j)[0] - img.at<cv::Vec3b>(i, j)[1] - img.at<cv::Vec3b>(i, j)[2]) * 3 >> 2);// blue
                    img.at<cv::Vec3b>(i, j)[1] = cv::saturate_cast<uchar>(std::abs(img.at<cv::Vec3b>(i, j)[1] - img.at<cv::Vec3b>(i, j)[0] - img.at<cv::Vec3b>(i, j)[2]) * 3 >> 2);// green
                    img.at<cv::Vec3b>(i, j)[2] = cv::saturate_cast<uchar>(std::abs(img.at<cv::Vec3b>(i, j)[2] - img.at<cv::Vec3b>(i, j)[0] - img.at<cv::Vec3b>(i, j)[1]) * 3 >> 2);// red
                }
            }
    }
}

#endif // FILTER_H

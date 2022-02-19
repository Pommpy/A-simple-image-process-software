#ifndef REQ_H
#define REQ_H
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>

#include <opencv.hpp>
using namespace std;
using namespace cv;

void Req1(const Mat& src, Mat& dst, int b) {//要求一
    if (src.empty()) return;
    if(b==0) dst.create(src.size(), src.type());
    else if(b==1) {
        dst.create(src.size(), src.type());
        // 灰度指数变换
        // 指数灰度变换是对输入图像的灰度值进行指数变换，进而校正亮度上的偏差。
        // 建立查表文件LUT
        double parameter = 0.4;
        unsigned char LUT[256];

        for (int i = 0; i < 256; i++)
        {
            //Gamma变换定义
            LUT[i] = saturate_cast<uchar>(pow((float)(i / 255.0), parameter) * 255.0f);
        }

        Mat dstImage = src.clone();

        //输入图像为单通道时，直接进行Gamma变换
        if (src.channels() == 1)
        {
            MatIterator_<uchar>iterator = dstImage.begin<uchar>();
            MatIterator_<uchar>iteratorEnd = dstImage.end<uchar>();
            for (; iterator != iteratorEnd; iterator++)
                *iterator = LUT[(*iterator)];
        }
        else
        {
            //输入通道为3通道时，需要对每个通道分别进行变换
            MatIterator_<Vec3b>iterator = dstImage.begin<Vec3b>();
            MatIterator_<Vec3b>iteratorEnd = dstImage.end<Vec3b>();
            //通过查表进行转换
            for (; iterator != iteratorEnd; iterator++)
            {
                (*iterator)[0] = LUT[((*iterator)[0])];
                (*iterator)[1] = LUT[((*iterator)[1])];
                (*iterator)[2] = LUT[((*iterator)[2])];
            }
        }
        dst = dstImage;
    }
    else if(b==2) {
        dst.create(src.size(), src.type());
        // 拉普拉斯边缘提取
        Mat gaosrc, ladst;
        GaussianBlur(src, gaosrc, Size(1, 1), 0);
        Laplacian(gaosrc, ladst, -1);
        convertScaleAbs(ladst, dst);
    }
    else if(b==3) {
        dst.create(src.size(), src.type());
        // 伽马校正
        double K = 3;
        uchar LUT[256];
            src.copyTo(dst);
            for (int i = 0; i < 256; i++) {
                //float f = (i + 0.5f) / 255;
                float f = i / 255.0;
                f = pow(f, K);
                //LUT[i] = saturate_cast<uchar>(f*255.0f-0.5f);
                LUT[i] = saturate_cast<uchar>(f * 255.0);
            }

            if (dst.channels() == 1) {
                MatIterator_<uchar> it = dst.begin<uchar>();
                MatIterator_<uchar> it_end = dst.end<uchar>();
                for (; it != it_end; ++it) {
                    *it = LUT[(*it)];
                }
            }
            else {
                MatIterator_<Vec3b> it = dst.begin<Vec3b>();
                MatIterator_<Vec3b> it_end = dst.end<Vec3b>();
                for (; it != it_end; ++it) {
                    (*it)[0] = LUT[(*it)[0]];
                    (*it)[1] = LUT[(*it)[1]];
                    (*it)[2] = LUT[(*it)[2]];
                }
            }
    }
    else if(b==4) {
        // 均值滤波
        dst.create(src.size(), src.type());
        blur(src, dst, Size(3,3));

    }
    else if(b==5){
        // 中值滤波
        dst.create(src.size(), src.type());
        medianBlur(src, dst, 3);
    }
    else if(b==6) {
        // 直方图均衡化
        int nRows = src.rows, nCols = src.cols;
        int nSumPix[256];
        double nProDis[256];
        double nSumProDis[256];
        int EqualizeSumPix[256];
        for (int i = 0; i < 256; i++)
        {
            nSumPix[i] = 0;
            nProDis[i] = 0.0;
            nSumProDis[i] = 0.0;
            EqualizeSumPix[i] = 0;
        }
        for (int i = 0; i < nRows; i++){
            for (int j = 0; j < nCols; j++){
                nSumPix[(int)src.at<uchar>(i, j)]++;
            }
        }
        for (int i = 0; i < 256; i++){
            nProDis[i] = (double)nSumPix[i] / (nRows * nCols);
        }
        nSumProDis[0] = nProDis[0];
        for (int i = 1; i < 256; i++){
            nSumProDis[i] = nSumProDis[i - 1] + nProDis[i];
        }
        for (int i = 0; i < 256; i++)
        {
            EqualizeSumPix[i] = cvRound((double)nSumProDis[i] * 255);
        }
        Mat resultImage(nRows, nCols, src.type());
        for (int i = 0; i < nRows; i++)
        {
            for (int j = 0; j < nCols; j++)
            {
                resultImage.at<uchar>(i, j) = EqualizeSumPix[(int)src.at<uchar>(i, j)];
            }
        }
        dst = resultImage;
    }
    else if(b == 7) {
        // 彩色负片
        src.copyTo(dst);
        //输入通道为3通道时，需要对每个通道分别进行变换
        MatIterator_<Vec3b>iterator = dst.begin<Vec3b>();
        MatIterator_<Vec3b>iteratorEnd = dst.end<Vec3b>();
        //通过查表进行转换
        for (; iterator != iteratorEnd; iterator++)
        {
            (*iterator)[0] = 255 - (*iterator)[0];
            (*iterator)[1] = 255 - (*iterator)[1];
            (*iterator)[2] = 255 - (*iterator)[2];
        }
    }
    else if(b == 8) {
        // 拉普拉斯锐化
        int kernel_size = 1;
        int scale = 1;
        int delta = 0;
        int ddepth = CV_16S;

        Mat dst1;
        src.copyTo(dst1);

        Mat abs_dst;
        Laplacian(src, dst1, ddepth, kernel_size, scale, delta, BORDER_DEFAULT);
        convertScaleAbs(dst1, abs_dst);
        dst = abs_dst;
    }
}

#endif // REQ_H

#ifndef ROTATION_H
#define ROTATION_H

#include <iostream>
#include <fstream>
#include <cstring>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/highgui/highgui_c.h>
#include <cstdio>
using namespace std;
using namespace cv;

void getrotate(InputArray src, OutputArray dst, int type){
    dst.create(src.size(), src.type());
    Mat input = src.getMat(), output = dst.getMat();
    transpose(input, output);
    flip(output, output, type);
    if(!output.data){
        cout << "-1" << "\n";
        return;
    }
}


#endif // ROTATION_H

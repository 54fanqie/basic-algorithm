//
//  main.m
//  基本算法
//
//  Created by 番茄 on 2017/9/21.
//  Copyright © 2017年 番茄. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>


//冒泡排序
void qipao(int a[],int num){
    for (int i=0; i< num-1; i++) {
        for (int j=0; j< num-1-i; j++) {
            if (a[j]<a[j+1]) {
                int tmp = a[j];
                a[j]=a[j+1];
                a[j+1] = tmp;
            }
        }
    }
}
//选择排序
void sort(int a[],int n){
    int i,j,index;
    for (i=0; i<n-1; i++) {
        index = i;
        NSLog(@"%d",index);
        for (j = i+1; j < n; j++) {
            if (a[index] > a[j]) {
                index = j;
            }
        }
        NSLog(@"%d",index);
        if (index!=i) {
            int tmp = a[i];
            a[i] = a[index];
            a[index] = tmp;
        }
    }
    
}

//快速排序
void quickSort(int arr[],int low,int high){
    if (low>=high) {
        return;
    }
    int i = low;
    int j = high;
    int pivot = arr[low];
    while (i < j) {
        while (i < j && pivot >= arr[j]) {
            j--;
        }
        arr[i] = arr[j];
        while (i < j && pivot <= arr[i]) {
            i++;
        }
        arr[j] = arr[i];
    }
    arr[i]  = pivot;
    quickSort(arr, low, i -1);
    quickSort(arr, i+1, high);
}
//二分值查找
int searchWithoutRecursion(int arr[],int low,int high,int targat){
    while (low <= high) {
        int mid = (low+high)/2;
        if (arr[mid] > targat) {
            high = mid-1;
        }else if (arr[mid] < targat){
            low = mid + 1;
        }else
            return mid;
    }
    while (low > high) {
        int mid = (low+high)/2;
        if (arr[mid] > targat) {
            high = mid+1;
        }else if (arr[mid] < targat){
            low = mid + 1;
        }else
            return mid;
    }
    
    return -1;
}
//二分值查找
int searchWithoutRecursion2(int arr[],int star,int end,int targat){
    int mid,right,left;
    right =end;
    left = star;
    
    while (left <= right) {
        mid = (left + right)/2;
        if (targat== arr[mid]) {
            return arr[mid];
        }else  if (targat < arr[mid]) {
            right = mid -1;
        }else if (targat > arr[mid]){
            left  = mid + 1;
        }
    }
    return -1;
}
//找出数组中第二大数
int findSecondBiggest(int arra[],int num){
    int max = arra[0];
    int second = arra[1];
    for (int i=0; i<num; i++) {
        if (max < arra[i]) {
            second = max;
            max =arra[i];
        }else if (max >arra[i] && second <arra[i]){
            second = arra[i];
        }
    }
    return second;
    
}
//如果数组中第一个元素为最大值的时候，找出最大值
int findSecondBiggest2(int ara[],int num){
    int first,second;
    first = second = ara[0];
    for (int i=1;i<num;i++) {
        if (ara[i] >first) {
            second  =first;
            first  =ara[i];
        }else if(ara[i] < first && ara[i] >second){
            second = ara[i];
        }
    }
    if (first == second) {
        second = ara[1];
        for (int i=1; i<num; i++) {
            if (ara[i] >second) {
                second = ara[i];
            }
        }
    }
    return second;
}

NSString*  spliterFunc(char *p) {
    
    char c[100][100];
    int i = 0;
    int j = 0;
    
    while (*p != '\0') {
        if (*p == ' ') {
            i++;
            j = 0;
        } else {
            c[i][j] = *p;
            j++;
        }
        
        p++;
        printf("%s\n",p);
    }
    //    char a[2];
    NSString * string;
    for (int k = i; k >= 0; k--) {
        printf("输出：%s\n", c[k]);
        if (k > 0) {
            printf(" ");
            
        } else {
            
            printf("\n");
        }
        
    }
    //    string = [NSString stringWithUTF8String:c[k]];
    NSLog(@"%@",string);
    return string;
}
//在子字符串查找在父字符串上的位置
NSInteger searchStringInSuperString(NSString * subStr,NSString * supStr){
    NSInteger supCount = supStr.length;
    NSInteger subCount  = subStr.length;
    NSInteger i = 0,j = 0,result = -1;
    //方法一
    //j为父字符串索引
    while (j < supCount && i < subCount) {
        if ([subStr characterAtIndex:i] == [supStr characterAtIndex:j]) {
            i++;
            j++;
        }else{
            j = j - i + 1;
            i = 0;
        }
        if (i == subCount) {
            NSLog(@"相同字符串位置%ld",(long)(j - i));
            result =  (long)(j - i);
        }else{
            NSLog(@"不相同字串");
            result = -1;
        }
    }
    //方法二
    //对其法则，如果def在一到abcdef最后一位还是没有相同那就是没有相同子串
    
    for (int i = 0; i <= supCount - subCount; i++) {//如果
        int j;
        for (j = 0; j < subCount; j++) {
            //拿出子串的第一个
            if ([subStr characterAtIndex:j] != [supStr characterAtIndex:j + i]) {
                break;
            }
        }
        if (j == subCount) {
            result = i;
        }
    }
    
    return result;
}

//链表逆序
typedef struct NODE {
    struct NODE *next;
    int num;
}node;
//创建一个链表
node *createLinkList(int length) {
    
    if (length <=0) {
        return NULL;
    }
    node *head,*p,*q;
    int number =1;
    head = (node *)malloc(sizeof(node));
    head->num =1;
    head->next = head;
    p = q = head;
    
    while (++number <= length) {
        
        p = (node *)malloc(sizeof(node));
        p->num = number;
        p->next =NULL;
        q->next = p;
        q = p;
    }
    return head;
}
//逆序
node* reverseFunc(node *head){
    
    if (head == NULL || head->next == NULL)//链表为空或者仅1个数直接返回
        return head;
    
    node* p = head, *newH = NULL;
    while (p != NULL)                 //一直迭代到链尾
    {
        node* tmp = p->next;          //暂存p下一个地址，防止变化指针指向后找不到后续的数
        p->next = newH;               //p->next指向前一个空间
        newH = p;                     //新链表的头移动到p，扩长一步链表
        p = tmp;                   //p指向原始链表p指向的下一个空间
    }
    return newH;
}
//打印链表
void printLinkList(node *head) {
    
    if (head ==NULL) {
        return;
    }
    
    node *p = head;
    while (p) {
        
        printf("%d ", p->num);
        p = p -> next;
    }
    printf("\n");
}


//打印结果
void printResult (int arra[],int num,NSString * title){
    for (int i=0; i< num; i++) {
        NSLog(@"%@ : %d",title,arra[i]);
    }
    NSLog(@"\n");
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //冒泡排序
        int a[5] = {99,10,78,3,67};
        int num =sizeof(a)/sizeof(int);
        qipao(a,num);
        printResult(a,num,@"冒泡排序");
        
        
        //选择排序
        int b[8] = {33,55,22,11,10,78,4,67};
        int num2 =sizeof(b)/sizeof(int);
        sort(b, num2);
        printResult(b, num2, @"选择排序");
        
        //快速排序
        int c[7] = {15,3,5,11,7,9,2};
        int num3 =sizeof(c)/sizeof(int);
        quickSort(c, 0,num3-1);
        printResult(c, num3, @"快速排序");
        
        //二分值查找
        int d[5] = {1,2,3,4,5};
        int  xixi =searchWithoutRecursion2(d,d[0],d[4],3);
        NSLog(@"二分值查找 %d",xixi) ;
        //堆排序
        
        int e[6] = {46,4,10,18,27,34};
        int num4 = sizeof(e)/sizeof(int);
        int second =findSecondBiggest(e,num4);
        NSLog(@"第二大数%d",second);
        //若数组第一个为最大数，且第二位与最大数相同
        int f[7] = {55,23,8,10,18,27,34};
        int num5 = sizeof(f)/sizeof(int);
        int second2 =findSecondBiggest2(f,num5);
        NSLog(@"若数组第一个为最大数，且第二位与最大数相同，找出第二大数%d",second2);
        
        //实现hello world  输出结果为world hello
        char *p ="helloword";
        char p1 = spliterFunc(p);
        NSLog(@"%c",p1);
        
        //在父字符串中查找子字符串的算法
        NSString *  supStr = @"123456789qwertyuiopasdfghjklzxcvbnm";
        NSString *  subStr  = @"qwer";
        NSLog(@"%ld",searchStringInSuperString(subStr,supStr));
        
        //初始化链表
        node * no = createLinkList(10);
        if (no) {
            printLinkList(no);
            node * reverseno = reverseFunc(no);
            printLinkList(reverseno);
            free(reverseno);
        }
        free(no);
    }
    return 0;
}



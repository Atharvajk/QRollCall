#include<iostream>
using namespace std;

int main(){
    int min=999;
    int arr[]={20,3,5,99,6,8};
    for(int i=0;i<6;i++){
        if(min>arr[i])
        {
            min=arr[i];
            cout<<min<<endl;
        }
    }
    cout<<min;
    return 0;
}
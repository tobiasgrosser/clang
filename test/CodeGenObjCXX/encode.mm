// RUN: %clang_cc1 %s -triple=x86_64-apple-darwin10 -emit-llvm -o - | FileCheck %s

// CHECK: v17@0:8{vector<float, float, float>=}16
// CHECK: {vector<float, float, float>=}


template <typename T1, typename T2, typename T3> struct vector {
    vector(T1,T2,T3);
};

typedef vector< float, float, float > vector3f;

@interface SceneNode
{
 vector3f position;
}

@property (assign, nonatomic) vector3f position;

@end

@interface MyOpenGLView
{
@public
  vector3f position;
}
@property vector3f position;
@end

@implementation MyOpenGLView

@synthesize position;

-(void)awakeFromNib {
 SceneNode *sn;
 vector3f VF3(1.0, 1.0, 1.0);
 [sn setPosition:VF3];
}
@end
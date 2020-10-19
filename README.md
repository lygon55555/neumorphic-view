![스크린샷 2020-10-08 오후 3 58 37](https://user-images.githubusercontent.com/39911797/95425485-5070d300-097f-11eb-9a53-efb44ea8f71b.png)
# Neumorphic-View
With IBDesignable NeumorphicView Class, you can easily add neumorphic-views on storyboards.  
Inspired by Alexplyuto's Neumorphism design.

# How to use
1. Add `NeumorphicView.swift` to your project folder or copy the code.  
2. Go to your storyboard, and add an UIView.  
3. Open the Identity Inspector and type `NeumorphicView` the Class field.  
![스크린샷 2020-10-07 오후 3 43 14](https://user-images.githubusercontent.com/39911797/95297974-4931c280-08b6-11eb-989a-80a8ca1d0837.png)
4. On the Attributes Inspector, change the values whatever you want.  
![스크린샷 2020-10-07 오후 3 43 21](https://user-images.githubusercontent.com/39911797/95297975-4931c280-08b6-11eb-906b-ca0b8826de4a.png)

# Shape of View
There are 4 types of shape.  
`Flat(0), Concave(1), Convex(2), Pressed(3)`  
Since Xcode doesn't support custom drop-down menu, you have to choose the type of shape by number.  
|![스크린샷 2020-10-07 오후 2 51 03](https://user-images.githubusercontent.com/39911797/95298108-8302c900-08b6-11eb-9071-f31a4d0c6c4d.png)|![스크린샷 2020-10-07 오후 2 51 11](https://user-images.githubusercontent.com/39911797/95298116-85fdb980-08b6-11eb-914a-65962d42fab6.png)|![스크린샷 2020-10-07 오후 2 51 18](https://user-images.githubusercontent.com/39911797/95298123-87c77d00-08b6-11eb-8e0c-cbd454157ce7.png)|![스크린샷 2020-10-07 오후 2 51 25](https://user-images.githubusercontent.com/39911797/95298126-89914080-08b6-11eb-8f35-0ca055f38719.png)|
|:---:|:---:|:---:|:---:|
|Flat|Concave|Convex|Pressed|

<br>

# Direction of Shadow
There are 4 types of direction.  
`Top-Left(0), Top-Right(1), Bottom-Left(2), Bottom-Right(3)`  
You also hvae to choose the type of direction by number.  
|![스크린샷 2020-10-07 오후 2 54 33](https://user-images.githubusercontent.com/39911797/95298468-16d49500-08b7-11eb-8b26-4c3fb4cd7acc.png)|![스크린샷 2020-10-07 오후 2 54 39](https://user-images.githubusercontent.com/39911797/95298481-1c31df80-08b7-11eb-97fa-7682ba7174ce.png)|![스크린샷 2020-10-07 오후 2 54 45](https://user-images.githubusercontent.com/39911797/95298489-1f2cd000-08b7-11eb-9cfd-a1bf68339baa.png)|![스크린샷 2020-10-07 오후 2 54 52](https://user-images.githubusercontent.com/39911797/95298495-20f69380-08b7-11eb-998a-f2cd5b17294c.png)|
|:---:|:---:|:---:|:---:|
|Top-Left|Top-Right|Bottom-Left|Bottom-Right|

<br>

# Intensity of Shadow
Opacity = 1, Shadow Radius = 25, Offset = 20  
Check the differences when only changing the value of intensity.  
|![스크린샷 2020-10-19 오전 10 57 29](https://user-images.githubusercontent.com/39911797/96393551-6c376d00-11fa-11eb-9912-f19b69b3bcea.png)|![스크린샷 2020-10-19 오전 10 57 35](https://user-images.githubusercontent.com/39911797/96393583-840ef100-11fa-11eb-8e9d-7102104d2ca3.png)|![스크린샷 2020-10-19 오전 10 57 42](https://user-images.githubusercontent.com/39911797/96393595-8e30ef80-11fa-11eb-8036-fc117512cb67.png)|![스크린샷 2020-10-19 오전 10 57 49](https://user-images.githubusercontent.com/39911797/96393604-9721c100-11fa-11eb-8a5f-5c9aad705e84.png)|
|:---:|:---:|:---:|:---:|
|Intensity = 10|Intensity = 20|Intensity = 30|Intensity = 40|

<br>

# References
* https://neumorphism.io/
* https://uxdesign.cc/neumorphism-in-user-interfaces-b47cef3bf3a6
* https://medium.muz.li/skeuomorphism-neumorphism-ui-trend-e7b78792bd21

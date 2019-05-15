# Tips:
1 绘制图形并保存后，应及时用‘close \handle’命令关闭图片，否则handle会于数组出现冲突。
例如，会在运行至fig5 = Plot(x,y)时出错。因为1，2，3，4同时表示图片句柄

```matlab
x = [1,2,3,4];
y = [0.1,0.2,0.3,0.4];
fig1 = Plot(x,y);
fig2 = Plot(x,y);
fig3 = Plot(x,y);
fig4 = Plot(x,y);
fig5 = Plot(x,y);% error
```

应修改为

```matlab
x = [1,2,3,4];
y = [0.1,0.2,0.3,0.4];
fig1 = Plot(x,y);
close 1
fig2 = Plot(x,y);
close 1
fig3 = Plot(x,y);
close 1
fig4 = Plot(x,y);
close 1
fig5 = Plot(x,y);
close 1
```
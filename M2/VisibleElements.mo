﻿within M2;
package VisibleElements
  model IRV "运行实体间变量"
    extends M2.AUTOSARTemplates.SWComponentTemplate.Datatype.DataPrototypes.DataPrototype;
    parameter Real sample_time_source = 1 "采样周期" annotation(
      HideResult = true);
    parameter Real sample_time_target = 1 "采样周期" annotation(
      HideResult = true);
    Modelica.Blocks.Interfaces.RealInput u 
      annotation(Placement(transformation(origin = {-110, -6}, 
      extent = {{-10.000000000000028, -10}, {10, 10}})));
    Modelica.Blocks.Interfaces.RealOutput y_(start = 0) 
      annotation(Placement(transformation(origin = {110, -6}, 
      extent = {{-10, -10}, {10, 10}})));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, 
      grid = {2, 2}), graphics = {Rectangle(origin = {-13.000000000000004, -6}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-87, 30}, {112, -30}}, 
      radius = 30), Ellipse(origin = {70, -6}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      extent = {{-30, 30}, {30, -30}}), Text(origin = {2.75, -117}, 
      lineColor = {0, 0, 0}, 
      extent = {{-85.25, 15}, {85.25, -15}}, 
      textString = "%name", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None)}), Protection(access = Access.diagram));
    Real last_sample_time(start = 0);
    Real temp(start = 0);
    Real flag(start = 0);
    //Real lastTime(start=0);
    parameter Boolean filter = true;


  algorithm
    // 1. filter=false：直接透传，不使用采样逻辑
    when not filter and time > 0 then
      y_ := u;
    end when;

    // 2. filter=true：使用原始采样逻辑，各个分支互斥处理
    when filter and abs(sample_time_source - sample_time_target) < 1e-6 and time - last_sample_time > 0.001 then
      y_ := u;
      last_sample_time := time;
    end when;

    when filter and sample_time_source < sample_time_target and time - last_sample_time >= sample_time_target then
      y_ := u;
      last_sample_time := last_sample_time + sample_time_target;
    end when;

    when filter and sample_time_source > sample_time_target and time < sample_time_target then
      y_ := 0;
    end when;

    when filter and sample_time_source > sample_time_target and time - last_sample_time >= sample_time_target and flag > 1 then
      y_ := temp;
      temp := u;
      last_sample_time := time;
    end when;

    when filter and sample_time_source > sample_time_target and time - last_sample_time >= sample_time_target and flag <= 1 then
      flag := flag + 1;
      y_ := u;
      temp := u;
      last_sample_time := time;
    end when;

  end IRV;


  block RPORT "需型端口"
    extends M2.AUTOSARTemplates.SWComponentTemplate.Components.RPortPrototype;
    parameter Real sample_time = 1 "采样周期" annotation(
      HideResult = true);
    Modelica.Blocks.Interfaces.RealInput u 
      annotation(Placement(transformation(origin = {-102.5, -2.9999999999999996}, 
      extent = {{-2.5, -2.5}, {2.5, 2.5}})));
    Modelica.Blocks.Interfaces.RealOutput y_ 
      annotation(Placement(transformation(origin = {100.5, -4}, 
      extent = {{-1.5, -1.5}, {1.5, 1.5}})));
    annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, 
      grid = {2, 2}), graphics = {Polygon(origin = {1, -1}, 
      fillColor = {0, 0, 0}, 
      fillPattern = FillPattern.Solid, 
      points = {{-101, 101}, {101, -3}, {-101, -101}}), Text(origin = {0.9999999999999929, -109}, 
      lineColor = {0, 0, 0}, 
      extent = {{-116, 11}, {116, -11}}, 
      textString = "%name", 
      textStyle = {TextStyle.None}, 
      textColor = {0, 0, 0}, 
      horizontalAlignment = LinePattern.None)}), Protection(access = Access.diagram));
    Real last_sample_time(start = 0);  // 使用start参数初始化为0
    parameter Boolean filter = true;
  algorithm
    if filter == true then
      if time - last_sample_time >= sample_time then
        y_ := u;
        last_sample_time := last_sample_time + sample_time;
      end if;
    else
      y_ := u;
    end if;
  end RPORT;

  connector PPORT = output Real "AUTOSAR中S/R模式的供型端口" annotation (
    defaultComponentName = "pport", 
    Icon(
      coordinateSystem(preserveAspectRatio = true, 
        extent = {{-100.0, -100.0}, {100.0, 100.0}}), 
      graphics = {
      Polygon(
      lineColor = {0, 0, 127}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{-100.0, 100.0}, {100.0, 0.0}, {-100.0, -100.0}})}), 
    Diagram(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}}, 
      preserveAspectRatio = true, 
      grid = {2.0, 2.0}), graphics = {Polygon(origin = {-50.0, 0.0}, 
      lineColor = {0, 0, 127}, 
      fillColor = {255, 255, 255}, 
      fillPattern = FillPattern.Solid, 
      points = {{-50.0, 50.0}, {50.0, 0.0}, {-50.0, -50.0}}), Text(origin = {-56.0, -67.0}, 
      lineColor = {0, 0, 127}, 
      extent = {{0.0, -25.0}, {0.0, 25.0}}, 
      textString = "%name", 
      textColor = {0, 0, 127})}), 
    Documentation(info = "<html>
<p>
Connector with one output signal of type Real.
</p>
</html>"      ), Protection(access = Access.diagram));
  end VisibleElements;
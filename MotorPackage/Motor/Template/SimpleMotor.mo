within MotorPackage.Motor.Template;
model SimpleMotor
  extends Interface.Base;
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=0.9)
    annotation (Placement(transformation(extent={{-30,20},{-10,40}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=0.005)
    annotation (Placement(transformation(extent={{10,20},{30,40}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Basic.RotationalEMF emf(k=-1)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=-90,
        origin={-70,0})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(signalVoltage.n, resistor.p)
    annotation (Line(points={{-70,10},{-70,30},{-30,30}}, color={0,0,255}));
  connect(resistor.n, inductor.p)
    annotation (Line(points={{-10,30},{10,30}}, color={0,0,255}));
  connect(inductor.n, emf.p)
    annotation (Line(points={{30,30},{40,30},{40,10}}, color={0,0,255}));
  connect(emf.n, ground.p)
    annotation (Line(points={{40,-10},{40,-20},{0,-20}}, color={0,0,255}));
  connect(signalVoltage.p, ground.p)
    annotation (Line(points={{-70,-10},{-70,-20},{0,-20}}, color={0,0,255}));
  connect(emf.flange, inertia.flange_a)
    annotation (Line(points={{50,0},{60,0}}, color={0,0,0}));
  connect(u, signalVoltage.v)
    annotation (Line(points={{-120,0},{-82,0}}, color={0,0,127}));
  connect(inertia.flange_b, flange_a)
    annotation (Line(points={{80,0},{100,0}}, color={0,0,0}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-88,44},{72,-28}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-52,-14},{40,-14},{64,-68},{92,-68},{92,-90},{-94,-90},{-94,-70},
              {-72,-70},{-70,-70},{-52,-14}},
          lineColor={28,108,200},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-20,18}}, color={28,108,200}),
        Rectangle(
          extent={{56,8},{100,-8}},
          lineColor={28,108,200},
          fillColor={162,29,33},
          fillPattern=FillPattern.Solid)}));
end SimpleMotor;

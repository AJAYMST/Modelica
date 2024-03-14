within MotorPackage.Motor.Template;
model SimpleMotor
  extends Interface.Base;
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=0.4)
    annotation (Placement(transformation(extent={{-30,20},{-10,40}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=0.05)
    annotation (Placement(transformation(extent={{10,20},{30,40}})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  Modelica.Electrical.Analog.Basic.RotationalEMF emf
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage annotation (
      Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=-90,
        origin={-70,0})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.001)
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
  connect(inertia.flange_b, flange_b)
    annotation (Line(points={{80,0},{100,0}}, color={0,0,0}));
end SimpleMotor;

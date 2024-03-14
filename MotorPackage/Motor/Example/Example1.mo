within MotorPackage.Motor.Example;
model Example1
  extends Modelica.Icons.Example;
  Template.SimpleMotor simpleMotor
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Constant const(k=5)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(const.y, simpleMotor.u)
    annotation (Line(points={{-59,0},{-22,0}}, color={0,0,127}));
end Example1;

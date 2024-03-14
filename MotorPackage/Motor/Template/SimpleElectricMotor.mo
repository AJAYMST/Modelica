within MotorPackage.Motor.Template;
model SimpleElectricMotor
  parameter Real ratio=2 "Transmission ratio (flange_a.phi/flange_b.phi)";
  parameter .Modelica.Units.SI.Inertia J "Moment of inertia";
  Template.SimpleMotor simpleMotor
    annotation (Placement(transformation(extent={{-42,-10},{-22,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b m1 "Right flange of shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(simpleMotor.u, u)
    annotation (Line(points={{-44,0},{-120,0}}, color={0,0,127}));
  connect(inertia.flange_b, m1)
    annotation (Line(points={{50,0},{100,0}}, color={0,0,0}));
  connect(simpleMotor.flange_a, inertia.flange_a)
    annotation (Line(points={{-22,0},{30,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-90,42},{70,-30}},
          lineColor={28,108,200},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-54,-16},{38,-16},{62,-70},{90,-70},{90,-92},{-96,-92},{-96,
              -72},{-74,-72},{-72,-72},{-54,-16}},
          lineColor={28,108,200},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{54,6},{98,-10}},
          lineColor={28,108,200},
          fillColor={162,29,33},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SimpleElectricMotor;

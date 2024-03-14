within MotorPackage.Motor.Experiments;
model Example2 "Simple electric Motor with PID controller"
  extends Modelica.Icons.Example;
  Template.SimpleElectricMotor simpleElectricMotor(J=1)
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  Modelica.Mechanics.Rotational.Sources.LinearSpeedDependentTorque load(
      w_nominal=300, tau_nominal=-60) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={30,0})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{10,-50},{-10,-30}})));
  Modelica.Blocks.Continuous.LimPID PID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMin=0,
    initType=Modelica.Blocks.Types.Init.NoInit,
    yMax=300,
    Ti=0.1,
    k=10,
    Td=0.01) annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Modelica.Blocks.Sources.Ramp speed_sp(
    height=-50,
    duration=10,
    offset=200,
    startTime=200)
    annotation (Placement(transformation(extent={{-96,-10},{-76,10}})));
equation
  connect(speed_sp.y, PID.u_s)
    annotation (Line(points={{-75,0},{-48,0}}, color={0,0,127}));
  connect(PID.y, simpleElectricMotor.u)
    annotation (Line(points={{-25,0},{-20,0}}, color={0,0,127}));
  connect(simpleElectricMotor.m1, load.flange)
    annotation (Line(points={{2,0},{20,0}}, color={0,0,0}));
  connect(speedSensor.flange, load.flange)
    annotation (Line(points={{10,-40},{20,-40},{20,0}}, color={0,0,0}));
  connect(speedSensor.w, PID.u_m)
    annotation (Line(points={{-11,-40},{-36,-40},{-36,-12}}, color={0,0,127}));
  annotation (experiment(StopTime=300, __Dymola_Algorithm="Dassl"));
end Example2;

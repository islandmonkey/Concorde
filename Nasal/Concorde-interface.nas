# EXPORT : functions ending by export are called from xml
# CRON : functions ending by cron are called from timer
# SCHEDULE : functions ending by schedule are called from cron


# =====
# SEATS
# =====

Seats = {};

Seats.new = func {
<<<<<<< HEAD
   var obj = { parents : [Seats,System],

               audio : AudioPanel.new(),
               rail : SeatRail.new(),

               lookup : {},
               names : {},
               nb_seats : 0,

               firstseat : constant.FALSE,
               firstseatview : 0,
               fullcockpit : constant.FALSE,

               CAPTINDEX : 0,

               floating : {},
               recoverfloating : constant.FALSE,
               last_recover : {},
               initial : {}
=======
   var obj = { parents : [Seats],

           controls : nil,
           engineer : nil,
           positions : nil,
           theseats : nil,
           theviews : nil,

           audio : AudioPanel.new(),
           rail : SeatRail.new(),

           lookup : {},
           names : {},
           nb_seats : 0,

           firstseat : constant.FALSE,
           firstseatview : 0,
           fullcockpit : constant.FALSE,
           fulloutside : constant.FALSE,

           CAPTINDEX : 0,

           floating : {},
           recoverfloating : constant.FALSE,
           last_recover : {},
           initial : {}
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
         };

   obj.init();

   return obj;
};

Seats.init = func {
<<<<<<< HEAD
   var child = nil;
   var name = "";

   me.inherit_system("/systems/seat");


   # retrieve the index as created by FG
   for( var i = me.CAPTINDEX; i < size(me.dependency["views"]); i=i+1 ) {
        child = me.dependency["views"][i].getChild("name");
=======
   var last = 0;
   var child = nil;
   var name = "";


   me.controls = props.globals.getNode("/controls/seat");
   me.engineer = props.globals.getNode("/systems/human/engineer");
   me.positions = props.globals.getNode("/systems/seat/position");
   me.theseats = props.globals.getNode("/systems/seat");
   me.theviews = props.globals.getNode("/sim").getChildren("view");

   last = size(me.theviews);


   # retrieve the index as created by FG
   for( var i = me.CAPTINDEX; i < last; i=i+1 ) {
        child = me.theviews[i].getChild("name");
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

        # nasal doesn't see yet the views of preferences.xml
        if( child != nil ) {
            name = child.getValue();
            if( name == "Engineer View" ) {
                me.save_lookup("engineer", i);
            }
            elsif( name == "Overhead View" ) {
                me.save_lookup("overhead", i);
            }
            elsif( name == "Copilot View" ) {
                me.save_lookup("copilot", i);
            }
            elsif( name == "Steward View" ) {
                 me.save_lookup("steward", i);
<<<<<<< HEAD
                 me.save_initial( "steward", me.dependency["views"][i] );
            }
            elsif( name == "Observer View" ) {
                 me.save_lookup("observer", i);
                 me.save_initial( "observer", me.dependency["views"][i] );
            }
            elsif( name == "Observer 2 View" ) {
                 me.save_lookup("observer2", i);
                 me.save_initial( "observer2", me.dependency["views"][i] );
            }
            elsif( name == "Main Gear View" ) {
                me.save_lookup("gear-main", i);
                me.save_initial( "gear-main", me.dependency["views"][i] );
            }
            elsif( name == "Front Gear View" ) {
                me.save_lookup("gear-front", i);
                me.save_initial( "gear-front", me.dependency["views"][i] );
=======
                 me.save_initial( "steward", me.theviews[i] );
            }
            elsif( name == "Observer View" ) {
                 me.save_lookup("observer", i);
                 me.save_initial( "observer", me.theviews[i] );
            }
            elsif( name == "Observer 2 View" ) {
                 me.save_lookup("observer2", i);
                 me.save_initial( "observer2", me.theviews[i] );
            }
            elsif( name == "Main Gear View" ) {
                me.save_lookup("gear-main", i);
                me.save_initial( "gear-main", me.theviews[i] );
            }
            elsif( name == "Front Gear View" ) {
                me.save_lookup("gear-front", i);
                me.save_initial( "gear-front", me.theviews[i] );
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            }
        }
   }

   # default
<<<<<<< HEAD
   me.recoverfloating = me.itself["root-ctrl"].getChild("recover").getValue();
   me.fullcockpit = me.itself["root-ctrl"].getChild("all").getValue();
=======
   me.recoverfloating = me.controls.getChild("recover").getValue();
   me.fullcockpit = me.controls.getChild("all").getValue();
   me.fulloutside = me.controls.getChild("all-outside").getValue();
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
}

Seats.railexport = func( name ) {
   me.rail.toggle( name );
}

Seats.fullexport = func {
   if( me.fullcockpit ) {
       me.fullcockpit = constant.FALSE;
   }
   else {
       me.fullcockpit = constant.TRUE;
   }

<<<<<<< HEAD
   me.itself["root-ctrl"].getChild("all").setValue( me.fullcockpit );
=======
   me.controls.getChild("all").setValue( me.fullcockpit );
}

Seats.fulloutsideexport = func {
   if( me.fulloutside ) {
       me.fulloutside = constant.FALSE;
   }
   else {
       me.fulloutside = constant.TRUE;
   }

   me.controls.getChild("all-outside").setValue( me.fulloutside );
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
}

Seats.viewexport = func( name ) {
   var index = 0;

   me.engineerhead();

   # cannot disable captain view, because of userarchive
   if( name != "captain" ) {
       index = me.lookup[name];

       # swap to view
<<<<<<< HEAD
       if( !me.itself["root"].getChild(name).getValue() ) {
           me.dependency["current-view"].getChild("view-number").setValue(index);
           me.itself["root"].getChild(name).setValue(constant.TRUE);
           me.itself["root"].getChild("captain").setValue(constant.FALSE);

           me.dependency["views"][index].getChild("enabled").setValue(constant.TRUE);
=======
       if( !me.theseats.getChild(name).getValue() ) {
           setprop("/sim/current-view/view-number", index);
           me.theseats.getChild(name).setValue(constant.TRUE);
           me.theseats.getChild("captain").setValue(constant.FALSE);

           me.theviews[index].getChild("enabled").setValue(constant.TRUE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
       }

       # return to captain view
       else {
<<<<<<< HEAD
           me.dependency["current-view"].getChild("view-number").setValue(me.CAPTINDEX);
           me.itself["root"].getChild(name).setValue(constant.FALSE);
           me.itself["root"].getChild("captain").setValue(constant.TRUE);

           me.dependency["views"][index].getChild("enabled").setValue(constant.FALSE);
=======
           setprop("/sim/current-view/view-number", me.CAPTINDEX);
           me.theseats.getChild(name).setValue(constant.FALSE);
           me.theseats.getChild("captain").setValue(constant.TRUE);

           me.theviews[index].getChild("enabled").setValue(constant.FALSE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
       }

       # disable all other views
       for( var i = 0; i < me.nb_seats; i=i+1 ) {
            if( name != me.names[i] ) {
<<<<<<< HEAD
                me.itself["root"].getChild(me.names[i]).setValue(constant.FALSE);
   
                index = me.lookup[me.names[i]];
                me.dependency["views"][index].getChild("enabled").setValue(constant.FALSE);
=======
                me.theseats.getChild(me.names[i]).setValue(constant.FALSE);
   
                index = me.lookup[me.names[i]];
                me.theviews[index].getChild("enabled").setValue(constant.FALSE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            }
       }

       me.recover();
   }

   # captain view
   else {
<<<<<<< HEAD
       me.dependency["current-view"].getChild("view-number").setValue(me.CAPTINDEX);
       me.itself["root"].getChild("captain").setValue(constant.TRUE);

       # disable all other views
       for( var i = 0; i < me.nb_seats; i=i+1 ) {
            me.itself["root"].getChild(me.names[i]).setValue(constant.FALSE);

            index = me.lookup[me.names[i]];
            me.dependency["views"][index].getChild("enabled").setValue(constant.FALSE);
=======
       setprop("/sim/current-view/view-number",me.CAPTINDEX);
       me.theseats.getChild("captain").setValue(constant.TRUE);

       # disable all other views
       for( var i = 0; i < me.nb_seats; i=i+1 ) {
            me.theseats.getChild(me.names[i]).setValue(constant.FALSE);

            index = me.lookup[me.names[i]];
            me.theviews[index].getChild("enabled").setValue(constant.FALSE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
       }
   }

   me.audioexport();

<<<<<<< HEAD
   me.itself["root-ctrl"].getChild("all").setValue( me.fullcockpit );
=======
   me.controls.getChild("all").setValue( me.fullcockpit );
   me.controls.getChild("all-outside").setValue( constant.FALSE );
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
}

Seats.recoverexport = func {
   me.recoverfloating = !me.recoverfloating;
<<<<<<< HEAD
   me.itself["root-ctrl"].getChild("recover").setValue(me.recoverfloating);
=======
   me.controls.getChild("recover").setValue(me.recoverfloating);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
}

Seats.engineerhead = func {
   # current orientation, before leaving view
<<<<<<< HEAD
   if( me.itself["root"].getChild("engineer").getValue() ) {
       # except, when 3D engineer is rotating the seat
       if( me.dependency["engineer"].getChild("seat-deg").getValue() == 0.0 ) {
           var headdeg = me.dependency["current-view"].getChild("goal-heading-offset-deg").getValue();
           me.itself["position"].getNode("engineer").getChild("heading-deg").setValue(headdeg);
=======
   if( me.theseats.getChild("engineer").getValue() ) {
       # except, when 3D engineer is rotating the seat
       if( me.engineer.getChild("seat-deg").getValue() == 0.0 ) {
           var headdeg = getprop("/sim/current-view/goal-heading-offset-deg");
           me.positions.getNode("engineer").getChild("heading-deg").setValue(headdeg);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
       }
   }
}

Seats.scrollexport = func{
   me.stepView(1);
}

Seats.scrollreverseexport = func{
   me.stepView(-1);
}

Seats.stepView = func( step ) {
   var targetview = 0;
   var name = "";

   for( var i = 0; i < me.nb_seats; i=i+1 ) {
        name = me.names[i];
<<<<<<< HEAD
        if( me.itself["root"].getChild(name).getValue() ) {
=======
        if( me.theseats.getChild(name).getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            targetview = me.lookup[name];
            break;
        }
   }

   # ignores captain view
   if( targetview > me.CAPTINDEX ) {
<<<<<<< HEAD
       me.dependency["views"][me.CAPTINDEX].getChild("enabled").setValue(constant.FALSE);
=======
       me.theviews[me.CAPTINDEX].getChild("enabled").setValue(constant.FALSE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
   }

   view.stepView(step);

   # restores because of userarchive
   if( targetview > me.CAPTINDEX ) {
<<<<<<< HEAD
       me.dependency["views"][me.CAPTINDEX].getChild("enabled").setValue(constant.TRUE);
=======
       me.theviews[me.CAPTINDEX].getChild("enabled").setValue(constant.TRUE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
   }

   me.audioexport();

   me.restorefull();
}

# forwards is positiv
Seats.movelengthexport = func( step ) {
   var headdeg = 0.0;
   var prop = "";
   var sign = 0;
   var pos = 0.0;
   var result = constant.FALSE;

   if( me.move() ) {
<<<<<<< HEAD
       headdeg = me.dependency["current-view"].getChild("goal-heading-offset-deg").getValue();

       if( headdeg <= 45 or headdeg >= 315 ) {
           prop = "z-offset-m";
           sign = 1;
       }
       elsif( headdeg >= 135 and headdeg <= 225 ) {
           prop = "z-offset-m";
           sign = -1;
       }
       elsif( headdeg > 225 and headdeg < 315 ) {
           prop = "x-offset-m";
           sign = -1;
       }
       else {
           prop = "x-offset-m";
           sign = 1;
       }

       pos = me.dependency["current-view"].getChild(prop).getValue();
       pos = pos + sign * step;
       me.dependency["current-view"].getChild(prop).setValue(pos);
=======
       headdeg = getprop("/sim/current-view/goal-heading-offset-deg");

       if( headdeg <= 45 or headdeg >= 315 ) {
           prop = "/sim/current-view/z-offset-m";
           sign = 1;
       }
       elsif( headdeg >= 135 and headdeg <= 225 ) {
           prop = "/sim/current-view/z-offset-m";
           sign = -1;
       }
       elsif( headdeg > 225 and headdeg < 315 ) {
           prop = "/sim/current-view/x-offset-m";
           sign = -1;
       }
       else {
           prop = "/sim/current-view/x-offset-m";
           sign = 1;
       }

       pos = getprop(prop);
       pos = pos + sign * step;
       setprop(prop,pos);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

       result = constant.TRUE;
   }

   return result;
}

# left is negativ
Seats.movewidthexport = func( step ) {
   var headdeg = 0.0;
   var prop = "";
   var sign = 0;
   var pos = 0.0;
   var result = constant.FALSE;

   if( me.move() ) {
<<<<<<< HEAD
       headdeg = me.dependency["current-view"].getChild("goal-heading-offset-deg").getValue();

       if( headdeg <= 45 or headdeg >= 315 ) {
           prop = "x-offset-m";
           sign = 1;
       }
       elsif( headdeg >= 135 and headdeg <= 225 ) {
           prop = "x-offset-m";
           sign = -1;
       }
       elsif( headdeg > 225 and headdeg < 315 ) {
           prop = "z-offset-m";
           sign = 1;
       }
       else {
           prop = "z-offset-m";
           sign = -1;
       }

       pos = me.dependency["current-view"].getChild(prop).getValue();
       pos = pos + sign * step;
       me.dependency["current-view"].getChild(prop).setValue(pos);
=======
       headdeg = getprop("/sim/current-view/goal-heading-offset-deg");

       if( headdeg <= 45 or headdeg >= 315 ) {
           prop = "/sim/current-view/x-offset-m";
           sign = 1;
       }
       elsif( headdeg >= 135 and headdeg <= 225 ) {
           prop = "/sim/current-view/x-offset-m";
           sign = -1;
       }
       elsif( headdeg > 225 and headdeg < 315 ) {
           prop = "/sim/current-view/z-offset-m";
           sign = 1;
       }
       else {
           prop = "/sim/current-view/z-offset-m";
           sign = -1;
       }

       pos = getprop(prop);
       pos = pos + sign * step;
       setprop(prop,pos);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

       result = constant.TRUE;
   }

   return result;
}

# up is positiv
Seats.moveheightexport = func( step ) {
   var result = constant.FALSE;

   if( me.move() ) {
<<<<<<< HEAD
       pos = me.dependency["current-view"].getChild("y-offset-m").getValue();
       pos = pos + step;
       me.dependency["current-view"].getChild("y-offset-m").setValue(pos);
=======
       pos = getprop("/sim/current-view/y-offset-m");
       pos = pos + step;
       setprop("/sim/current-view/y-offset-m",pos);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

       result = constant.TRUE;
   }

   return result;
}

Seats.save_lookup = func( name, index ) {
   me.names[me.nb_seats] = name;

   me.lookup[name] = index;

   if( !me.firstseat ) {
       me.firstseatview = index;
       me.firstseat = constant.TRUE;
   }

   me.floating[name] = constant.FALSE;

   me.nb_seats = me.nb_seats + 1;
}

Seats.restorefull = func {
   var found = constant.FALSE;
<<<<<<< HEAD
   var index = me.dependency["current-view"].getChild("view-number").getValue();
=======
   var index = getprop("/sim/current-view/view-number");
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

   if( index == me.CAPTINDEX or index >= me.firstseatview ) {
       found = constant.TRUE;
   }

   if( found ) {
<<<<<<< HEAD
       me.itself["root-ctrl"].getChild("all").setValue( me.fullcockpit );
   }
   # systematically disable all instruments in external view
   else {
       me.itself["root-ctrl"].getChild("all").setValue( constant.FALSE );
   }
=======
       me.controls.getChild("all").setValue( me.fullcockpit );
   }
   # systematically disable all instruments in external view
   else {
       me.controls.getChild("all").setValue( constant.FALSE );
   }

   # systematically disable all model
   me.controls.getChild("all-outside").setValue( constant.FALSE );
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
}

# backup initial position
Seats.save_initial = func( name, view ) {
   var pos = {};
   var config = view.getNode("config");

   pos["x"] = config.getChild("x-offset-m").getValue();
   pos["y"] = config.getChild("y-offset-m").getValue();
   pos["z"] = config.getChild("z-offset-m").getValue();

   me.initial[name] = pos;

   me.floating[name] = constant.TRUE;
   me.last_recover[name] = constant.FALSE;
}

Seats.initial_position = func( name ) {
<<<<<<< HEAD
   var position = me.itself["position"].getNode(name);
=======
   var position = me.positions.getNode(name);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
   var posx = me.initial[name]["x"];
   var posy = me.initial[name]["y"];
   var posz = me.initial[name]["z"];

<<<<<<< HEAD
   me.dependency["current-view"].getChild("x-offset-m").setValue(posx);
   me.dependency["current-view"].getChild("y-offset-m").setValue(posy);
   me.dependency["current-view"].getChild("z-offset-m").setValue(posz);
=======
   setprop("/sim/current-view/x-offset-m",posx);
   setprop("/sim/current-view/y-offset-m",posy);
   setprop("/sim/current-view/z-offset-m",posz);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

   position.getChild("x-m").setValue(posx);
   position.getChild("y-m").setValue(posy);
   position.getChild("z-m").setValue(posz);

   position.getChild("move").setValue(constant.FALSE);
}

Seats.last_position = func( name ) {
   var position = nil;
   var posx = 0.0;
   var posy = 0.0;
   var posz = 0.0;

   # 1st restore
   if( !me.last_recover[ name ] and me.recoverfloating ) {
<<<<<<< HEAD
       position = me.itself["position"].getNode(name);
=======
       position = me.positions.getNode(name);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

       posx = position.getChild("x-m").getValue();
       posy = position.getChild("y-m").getValue();
       posz = position.getChild("z-m").getValue();

       if( posx != me.initial[name]["x"] or
           posy != me.initial[name]["y"] or
           posz != me.initial[name]["z"] ) {

<<<<<<< HEAD
           me.dependency["current-view"].getChild("x-offset-m").setValue(posx);
           me.dependency["current-view"].getChild("y-offset-m").setValue(posy);
           me.dependency["current-view"].getChild("z-offset-m").setValue(posz);
=======
           setprop("/sim/current-view/x-offset-m",posx);
           setprop("/sim/current-view/y-offset-m",posy);
           setprop("/sim/current-view/z-offset-m",posz);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

           position.getChild("move").setValue(constant.TRUE);
       }

       me.last_recover[ name ] = constant.TRUE;
   }
}

Seats.recover = func {
   var name = "";

   for( var i = 0; i < me.nb_seats; i=i+1 ) {
        name = me.names[i];
<<<<<<< HEAD
        if( me.itself["root"].getChild(name).getValue() ) {
=======
        if( me.theseats.getChild(name).getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            if( me.floating[name] ) {
                me.last_position( name );
            }
            break;
        }
   }
}

Seats.move_position = func( name ) {
<<<<<<< HEAD
   var posx = me.dependency["current-view"].getChild("x-offset-m").getValue();
   var posy = me.dependency["current-view"].getChild("y-offset-m").getValue();
   var posz = me.dependency["current-view"].getChild("z-offset-m").getValue();

   var position = me.itself["position"].getNode(name);
=======
   var posx = getprop("/sim/current-view/x-offset-m");
   var posy = getprop("/sim/current-view/y-offset-m");
   var posz = getprop("/sim/current-view/z-offset-m");
   var position = me.positions.getNode(name);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

   position.getChild("x-m").setValue(posx);
   position.getChild("y-m").setValue(posy);
   position.getChild("z-m").setValue(posz);

   position.getChild("move").setValue(constant.TRUE);
}

Seats.move = func {
   var result = constant.FALSE;

   # saves previous position
   for( var i = 0; i < me.nb_seats; i=i+1 ) {
        name = me.names[i];
<<<<<<< HEAD
        if( me.itself["root"].getChild(name).getValue() ) {
=======
        if( me.theseats.getChild(name).getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            if( me.floating[name] ) {
                me.move_position( name );
                result = constant.TRUE;
            }
            break;
        }
   }

   return result;
}

# restore view
Seats.restoreexport = func {
   var name = "";

   for( var i = 0; i < me.nb_seats; i=i+1 ) {
        name = me.names[i];
<<<<<<< HEAD
        if( me.itself["root"].getChild(name).getValue() ) {
=======
        if( me.theseats.getChild(name).getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            if( me.floating[name] ) {
                me.initial_position( name );
            }
            break;
        }
   }
}

# restore view pitch
Seats.restorepitchexport = func {
<<<<<<< HEAD
   var index = me.dependency["current-view"].getChild("view-number").getValue();

   if( index == me.CAPTINDEX ) {
       var headingdeg = me.dependency["views"][index].getNode("config").getChild("heading-offset-deg").getValue();
       var pitchdeg = me.dependency["views"][index].getNode("config").getChild("pitch-offset-deg").getValue();

       me.dependency["current-view"].getChild("heading-offset-deg").setValue(headingdeg);
       me.dependency["current-view"].getChild("pitch-offset-deg").setValue(pitchdeg);
=======
   var index = getprop("/sim/current-view/view-number");

   if( index == me.CAPTINDEX ) {
       var headingdeg = me.theviews[index].getNode("config").getChild("heading-offset-deg").getValue();
       var pitchdeg = me.theviews[index].getNode("config").getChild("pitch-offset-deg").getValue();

       setprop("/sim/current-view/heading-offset-deg", headingdeg );
       setprop("/sim/current-view/pitch-offset-deg", pitchdeg );
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
   }

   # only cockpit views
   else {
       var name = "";

       for( var i = 0; i < me.nb_seats; i=i+1 ) {
            name = me.names[i];
<<<<<<< HEAD
            if( me.itself["root"].getChild(name).getValue() ) {
                var headingdeg = me.dependency["views"][index].getNode("config").getChild("heading-offset-deg").getValue();
                var pitchdeg = me.dependency["views"][index].getNode("config").getChild("pitch-offset-deg").getValue();

                me.dependency["current-view"].getChild("heading-offset-deg").setValue(headingdeg);
                me.dependency["current-view"].getChild("pitch-offset-deg").setValue(pitchdeg);
=======
            if( me.theseats.getChild(name).getValue() ) {
                var headingdeg = me.theviews[index].getNode("config").getChild("heading-offset-deg").getValue();
                var pitchdeg = me.theviews[index].getNode("config").getChild("pitch-offset-deg").getValue();

                setprop("/sim/current-view/heading-offset-deg", headingdeg );
                setprop("/sim/current-view/pitch-offset-deg", pitchdeg );
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
                break;
            }
        }
   }
}

Seats.audioexport = func {
   var name = "";
   var panel = constant.TRUE;
<<<<<<< HEAD
   var marker = me.dependency["current-view"].getChild("internal").getValue();

   if( me.itself["root"].getChild("captain").getValue() ) {
       name = "captain";
   }
   elsif( me.itself["root"].getChild("copilot").getValue() ) {
       name = "copilot";
   }
   elsif( me.itself["root"].getChild("engineer").getValue() ) {
       name = "engineer";
   }
   elsif( me.itself["root"].getChild("observer").getValue() ) {
       name = "observer";
   }
=======
   var marker = getprop("/sim/current-view/internal");

   if( me.theseats.getChild("captain").getValue() ) {
       name = "captain";
   }
   elsif( me.theseats.getChild("copilot").getValue() ) {
       name = "copilot";
   }
   elsif( me.theseats.getChild("engineer").getValue() ) {
       name = "engineer";
   }
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
   else {
       panel = constant.FALSE;
   }

   me.audio.headphones( marker, panel, name );
}


# ====
# MENU
# ====

Menu = {};

Menu.new = func {
<<<<<<< HEAD
   var obj = { parents : [Menu,System],
=======
   var obj = { parents : [Menu],
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

# menu handles
               autopilot : nil,
               crew : nil,
<<<<<<< HEAD
               environment : {},
=======
               environment : nil,
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
               fuel : nil,
               ground : nil,
               instruments : {},
               navigation : nil,
               procedures : {},
               radios : nil,
               systems : nil,
<<<<<<< HEAD
               views : nil,
=======
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
               voice : {},
               menu : nil
         };

<<<<<<< HEAD
   obj.init();

   return obj;
};

Menu.init = func {
   me.inherit_system("/systems/crew");

   me.menu = me.dialog( "menu" );
   me.autopilot = me.dialog( "autopilot" );
   me.crew = me.dialog( "crew" );

   me.array( me.environment, 2, "environment" );

   me.fuel = me.dialog( "fuel" );
   me.ground = me.dialog( "ground" );

   me.array( me.instruments, 3, "instruments" );

   me.navigation = me.dialog( "navigation" );

   me.array( me.procedures, 4, "procedures" );

   me.radios = me.dialog( "radios" );
   me.systems = me.dialog( "systems" );
   me.views = me.dialog( "views" );

   me.array( me.voice, 2, "voice" );
}

Menu.dialog = func( name ) {
   var item = gui.Dialog.new(me.itself["dialogs"].getPath() ~ "/" ~ name ~ "/dialog",
                             "Aircraft/Concorde/Dialogs/Concorde-" ~ name ~ ".xml");

   return item;
}

Menu.array = func( table, max, name ) {
   var j = 0;

   for( var i = 0; i < max; i=i+1 ) {
        if( j == 0 ) {
            j = "";
        }
        else {
            j = i + 1;
        }

        table[i] = gui.Dialog.new(me.itself["dialogs"].getValue() ~ "/" ~ name ~ "[" ~ i ~ "]/dialog",
                                  "Aircraft/Concorde/Dialogs/Concorde-" ~ name ~ j ~ ".xml");
   }
=======
    obj.init();

    return obj;
};

Menu.init = func {
    me.menu = gui.Dialog.new("/sim/gui/dialogs/Concorde/menu/dialog",
                             "Aircraft/Concorde/Dialogs/Concorde-menu.xml");
    me.autopilot = gui.Dialog.new("/sim/gui/dialogs/Concorde/autopilot/dialog",
                                  "Aircraft/Concorde/Dialogs/Concorde-autopilot.xml");
    me.crew = gui.Dialog.new("/sim/gui/dialogs/Concorde/crew/dialog",
                             "Aircraft/Concorde/Dialogs/Concorde-crew.xml");
    me.environment = gui.Dialog.new("/sim/gui/dialogs/Concorde/environment/dialog",
                                    "Aircraft/Concorde/Dialogs/Concorde-environment.xml");
    me.fuel = gui.Dialog.new("/sim/gui/dialogs/Concorde/fuel/dialog",
                             "Aircraft/Concorde/Dialogs/Concorde-fuel.xml");
    me.ground = gui.Dialog.new("/sim/gui/dialogs/Concorde/ground/dialog",
                               "Aircraft/Concorde/Dialogs/Concorde-ground.xml");

    me.array( me.instruments, 3, "instruments" );

    me.navigation = gui.Dialog.new("/sim/gui/dialogs/Concorde/navigation/dialog",
                                   "Aircraft/Concorde/Dialogs/Concorde-navigation.xml");

    me.array( me.procedures, 4, "procedures" );

    me.radios = gui.Dialog.new("/sim/gui/dialogs/Concorde/radios/dialog",
                                "Aircraft/Concorde/Dialogs/Concorde-radios.xml");
    me.systems = gui.Dialog.new("/sim/gui/dialogs/Concorde/systems/dialog",
                                "Aircraft/Concorde/Dialogs/Concorde-systems.xml");

    me.array( me.voice, 2, "voice" );
}

Menu.array = func( table, max, name ) {
    var j = 0;

    for( var i = 0; i < max; i=i+1 ) {
       if( j == 0 ) {
           j = "";
       }
       else {
           j = i + 1;
       }

       table[i] = gui.Dialog.new("/sim/gui/dialogs/Concorde/" ~ name ~ "[" ~ i ~ "]/dialog",
                                 "Aircraft/Concorde/Dialogs/Concorde-" ~ name ~ j ~ ".xml");
    }
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
}


# ========
# CREW BOX
# ========

Crewbox = {};

Crewbox.new = func {
<<<<<<< HEAD
   var obj = { parents : [Crewbox,System],
=======
   var obj = { parents : [Crewbox],
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

           MENUSEC : 3.0,

           timers : 0.0,

<<<<<<< HEAD
=======
           copilot : nil,
           copilotcontrol : nil,
           crew : nil,
           crewcontrols : nil,
           engineercontrol : nil,
           voice : nil,

>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
# left bottom, 1 line, 10 seconds.
           BOXX : 10,
           BOXY : 34,
           BOTTOMY : -768,
           LINEY : 20,

           lineindex : { "speedup" : 0, "checklist" : 1, "engineer" : 2, "copilot" : 3 },
           lasttext : [ "", "", "", "" ],
           textbox : [ nil, nil, nil, nil ],
           nblines : 4
         };

    obj.init();

    return obj;
};

Crewbox.init = func {
<<<<<<< HEAD
    me.inherit_system("/systems/crew");

    me.resize();

    setlistener(me.noinstrument["startup"].getPath(), crewboxresizecron);
    setlistener(me.noinstrument["speed-up"].getPath(), crewboxcron);
    setlistener(me.noinstrument["freeze"].getPath(), crewboxcron);
=======
    me.copilot = props.globals.getNode("/systems/copilot");
    me.copilotcontrol = props.globals.getNode("/controls/copilot");
    me.crew = props.globals.getNode("/systems/crew");
    me.crewcontrols = props.globals.getNode("/controls/crew");
    me.engineer = props.globals.getNode("/systems/engineer");
    me.engineercontrol = props.globals.getNode("/controls/engineer");
    me.voice = props.globals.getNode("/systems/voice");
 

    me.resize();

    setlistener("/sim/startup/ysize", crewboxresizecron);
    setlistener("/sim/speed-up", crewboxcron);
    setlistener("/sim/freeze/master", crewboxcron);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
}

Crewbox.resize = func {
    var y = 0;
<<<<<<< HEAD
    var ysize = - me.noinstrument["startup"].getValue();
=======
    var ysize = - getprop("/sim/startup/ysize");
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

    if( ysize == nil ) {
        ysize = me.BOTTOMY;
    }

    # must clear the text, otherwise text remains after close
    me.clear();

    for( var i = 0; i < me.nblines; i = i+1 ) {
         # starts at 700 if height is 768
         y = ysize + me.BOXY + me.LINEY * i;

         # not really deleted
         if( me.textbox[i] != nil ) {
             me.textbox[i].close();
         }

         # CAUTION : duration is 0 (infinite), or one must wait that the text vanishes device;
         # otherwise, overwriting the text makes the view popup tip always visible !!!
         me.textbox[i] = screen.window.new( me.BOXX, y, 1, 0 );
    }

    me.crewtext();
    me.pausetext();
}

Crewbox.pausetext = func {
    var index = me.lineindex["speedup"];
    var speedup = 0.0;
    var red = constant.FALSE;
    var text = "";

<<<<<<< HEAD
    if( me.noinstrument["freeze"].getValue() ) {
        text = "pause";
    }
    else {
        speedup = me.noinstrument["speed-up"].getValue();
=======
    if( getprop("/sim/freeze/master") ) {
        text = "pause";
    }
    else {
        speedup = getprop("/sim/speed-up");
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
        if( speedup > 1 ) {
            text = sprintf( speedup, "3f.0" ) ~ "  t";
        }
        red = constant.TRUE;
    }

    me.sendpause( index, red, text );
}

crewboxresizecron = func {
    crewscreen.resize();
}

crewboxcron = func {
    crewscreen.pausetext();
}

Crewbox.minimizeexport = func {
<<<<<<< HEAD
    var value = me.itself["root"].getChild("minimized").getValue();

    me.itself["root"].getChild("minimized").setValue(!value);
=======
    var value = me.crew.getChild("minimized").getValue();

    me.crew.getChild("minimized").setValue(!value);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

    me.resettimer();
}

<<<<<<< HEAD
Crewbox.wakeupexport = func {
    # display is minimized by timeout, or by picking 3D crew / clue.
    if( !me.itself["root-ctrl"].getChild("timeout").getValue() and
        !me.dependency["human"].getChild("serviceable").getValue() ) {
        # wake up display
        if( me.itself["root"].getChild("minimized").getValue() ) {
            me.itself["root"].getChild("minimized").setValue(constant.FALSE);

            me.resettimer();
        }
    }
}

Crewbox.toggleexport = func {
    # 2D feedback
    if( !me.dependency["human"].getChild("serviceable").getValue() ) {
        me.itself["root"].getChild("minimized").setValue(constant.FALSE);
=======
Crewbox.toggleexport = func {
    # 2D feedback
    if( !getprop("/systems/human/serviceable") ) {
        me.crew.getChild("minimized").setValue(constant.FALSE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
        me.resettimer();
    }

    # to accelerate display
    me.crewtext();
}

Crewbox.schedule = func {
    # timeout on text box
<<<<<<< HEAD
    if( me.itself["root-ctrl"].getChild("timeout").getValue() ) {
        me.timers = me.timers + me.MENUSEC;
        if( me.timers >= me.timeoutsec() ) {
            me.itself["root"].getChild("minimized").setValue(constant.TRUE);
=======
    if( me.crewcontrols.getChild("timeout").getValue() ) {
        me.timers = me.timers + me.MENUSEC;
        if( me.timers >= me.timeoutsec() ) {
            me.crew.getChild("minimized").setValue(constant.TRUE);
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
        }
    }

    me.crewtext();
}

Crewbox.timeoutsec = func {
<<<<<<< HEAD
    var result = me.itself["root-ctrl"].getChild("timeout-s").getValue();
=======
    var result = me.crewcontrols.getChild("timeout-s").getValue();
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502

    if( result < me.MENUSEC ) {
        result = me.MENUSEC;
    }

    return result;
}

Crewbox.resettimer = func {
    me.timers = 0.0;

    me.crewtext();
}

Crewbox.crewtext = func {
    # text visible, only when 2D crew is minimized
<<<<<<< HEAD
    if( !me.itself["root"].getChild("minimized").getValue() ) {
=======
    if( !me.crew.getChild("minimized").getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
        me.checklisttext();
        me.copilottext();
        me.engineertext();
    }
    else {
        me.clearcrew();
    }
}

Crewbox.checklisttext = func {
    var white = constant.FALSE;
<<<<<<< HEAD
    var text = me.dependency["voice"].getChild("callout").getValue();
    var text2 = me.dependency["voice"].getChild("checklist").getValue();
    var index = me.lineindex["checklist"];

    if( text2 == "" ) {
        text2 = me.dependency["voice"].getChild("emergency").getValue();
=======
    var text = me.voice.getChild("callout").getValue();
    var text2 = me.voice.getChild("checklist").getValue();
    var index = me.lineindex["checklist"];

    if( text2 == "" ) {
        text2 = me.voice.getChild("emergency").getValue();
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
    }

    if( text2 != "" ) {
        text = text2 ~ " " ~ text;
<<<<<<< HEAD
        white = me.dependency["voice"].getChild("real").getValue();
=======
        white = me.voice.getChild("real").getValue();
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
    }

    # real checklist is white
    me.sendtext( index, constant.TRUE, white, text );
}

Crewbox.copilottext = func {
    var green = constant.FALSE;
<<<<<<< HEAD
    var text = me.dependency["copilot"].getChild("state").getValue();
    var index = me.lineindex["copilot"];

    if( text == "" ) {
        if( me.dependency["copilot-ctrl"].getChild("activ").getValue() ) {
=======
    var text = me.copilot.getChild("state").getValue();
    var index = me.lineindex["copilot"];

    if( text == "" ) {
        if( me.copilotcontrol.getChild("activ").getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            text = "copilot";
        }
    }

<<<<<<< HEAD
    if( me.dependency["copilot"].getChild("activ").getValue() or
        me.itself["root"].getChild("unexpected").getValue() ) {
=======
    if( me.copilot.getChild("activ").getValue() or
        me.crew.getChild("unexpected").getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
        green = constant.TRUE;
    }

    me.sendtext( index, green, constant.FALSE, text );
}

Crewbox.engineertext = func {
<<<<<<< HEAD
    var green = me.dependency["engineer"].getChild("activ").getValue();
    var text = me.dependency["engineer"].getChild("state").getValue();
    var index = me.lineindex["engineer"];

    if( text == "" ) {
        if( me.dependency["engineer-ctrl"].getChild("activ").getValue() ) {
=======
    var green = me.engineer.getChild("activ").getValue();
    var text = me.engineer.getChild("state").getValue();
    var index = me.lineindex["engineer"];

    if( text == "" ) {
        if( me.engineercontrol.getChild("activ").getValue() ) {
>>>>>>> 3e67f437a740a074d2a8cbc75be8689ad4011502
            text = "engineer";
        }
    }

    me.sendtext( index, green, constant.FALSE, text );
}

Crewbox.sendtext = func( index, green, white, text ) {
    var box = me.textbox[index];

    me.lasttext[index] = text;

    # bright white
    if( white ) {
        box.write( text, 1.0, 1.0, 1.0 );
    }

    # dark green
    elsif( green ) {
        box.write( text, 0, 0.7, 0 );
    }

    # dark yellow
    else {
        box.write( text, 0.7, 0.7, 0 );
    }
}

Crewbox.sendpause = func( index, red, text ) {
    var box = me.textbox[index];

    me.lasttext[index] = text;

    # bright red
    if( red ) {
        box.write( text, 1.0, 0, 0 );
    }
    # bright yellow
    else {
        box.write( text, 1.0, 1.0, 0 );
    }
}

Crewbox.clearcrew = func {
    for( var i = 1; i < me.nblines; i = i+1 ) {
         if( me.lasttext[i] != "" ) {
             me.lasttext[i] = "";
             me.textbox[i].write( me.lasttext[i], 0, 0, 0 );
         }
    }
}

Crewbox.clear = func {
    for( var i = 0; i < me.nblines; i = i+1 ) {
         if( me.lasttext[i] != "" ) {
             me.lasttext[i] = "";
             me.textbox[i].write( me.lasttext[i], 0, 0, 0 );
         }
    }
}


# =========
# VOICE BOX
# =========

Voicebox = {};

Voicebox.new = func {
   var obj = { parents : [Voicebox,System],

               seetext : constant.TRUE,

# centered in the vision field, 1 line, 10 seconds.
               textbox : screen.window.new( nil, -200, 1, 10 )
   };

   obj.init();

   return obj;
}

Voicebox.init = func {
   me.inherit_system("/systems/voice");
}

Voicebox.schedule = func {
   me.seetext = me.itself["root-ctrl"].getChild("text").getValue();
}

Voicebox.textexport = func {
   var feedback = "";

   if( me.seetext ) {
       feedback = "crew text off";
       me.seetext = constant.FALSE;
   }
   else {
       feedback = "crew text on";
       me.seetext = constant.TRUE;
   }

   me.sendtext( feedback, !me.seetext, constant.FALSE, constant.TRUE );
   me.itself["root-ctrl"].getChild("text").setValue(me.seetext);

   return feedback;
}

Voicebox.is_on = func {
   return me.seetext;
}

Voicebox.sendtext = func( text, engineer = 0, captain = 0, force = 0 ) {
   if( me.seetext or force ) {
       # bright blue
       if( engineer ) {
           me.textbox.write( text, 0, 1, 1 );
       }

       # bright yellow
       elsif( captain ) {
           me.textbox.write( text, 1, 1, 0 );
       }

       # bright green
       else {
           me.textbox.write( text, 0, 1, 0 );
       }
   }
}

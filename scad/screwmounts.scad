/************************************************************************

	screwmounts.scad
    
	Extreme Networks AP305C Bracket
    Copyright (C) 2021 Simon Inns
    
    This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module mount()
{
    difference() {
        // Screw holder
        union() {
            tube(h=8, id=8, od=12);
            tube(h=3, id=4, od=8);
        }
    }
}

module pad_mount()
{
    difference() {
        // Screw holder
        union() {
            cyl(h=8, d=10, center=false);
        }
    }
}

module screw_mounts()
{
    difference() {
        union() {
            difference() {
                union() {
                    rotate([0,0,-30]) {
                        move([0,30,0]) mount();
                        move([0,-30,0]) mount();
                    }

                    rotate([0,0,-30 - 90]) {
                        move([0,32,0]) pad_mount();
                        move([0,-32,0]) pad_mount();
                    }

                    tube(h=8, od=72, id=70);
                }

                move([0,0,-1]) tube(h=10, od=75, id=70);
            }

            move([0,0,0]) tube(h=8, od=72, id=70);
        }

        // 8mm bump-on cut outs
        rotate([0,0,-30]) {
            move([0,30,0]) cyl(h=1, d=8.5);
            move([0,-30,0]) cyl(h=1, d=8.5);
        }

        rotate([0,0,-30 - 90]) {
            move([0,32,0]) cyl(h=1, d=8.5);
            move([0,-32,0]) cyl(h=1, d=8.5);
        }
    }
}
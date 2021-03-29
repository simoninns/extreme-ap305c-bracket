/************************************************************************

	centre.scad
    
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


module central_part()
{
    difference() {
        move([0,0,0]) cyl(l=8, d=72, center=false);
        move([0,0,3]) cyl(l=6, d=70, center=false);
    }
}

module guide_pin()
{
    // Centre guide ring
    difference() {
        move([0,0,1]) cyl(l=4, d=27, center=false);
        move([0,0,1]) cyl(l=6, d=25, center=false);
    }

    // Centre guide cone
    move([0,0,3]) cyl(l=9, d1=7, d2=6, center=false);
}

module centre()
{
    central_part();
    guide_pin();
}
/*
	Global Parameters
*/

driveShaftHeight = 103;		// driveshaft height

shaftCouplingHeight=17; 	// cylinder height
shaftCouplingDiameter=20; 	// cylinder diameter

motorShaftHeight=17; 		// internal motor shaft height
motorShaftDiameter=5.2; 	// internal motor shaft diameter

lockingScrew="M3"; 			// locking screw thread



function getTotalHeight() = driveShaftHeight + shaftCouplingHeight;

function getDriveShaftHeight() = driveShaftHeight;

function getShaftCouplingHeight() = shaftCouplingHeight;
function getShaftCouplingDiameter() = shaftCouplingDiameter;

function getMotorShaftHeight() = motorShaftHeight;
function getMotorShaftDiameter() = motorShaftDiameter;

function getLockingScrew() = lockingScrew;
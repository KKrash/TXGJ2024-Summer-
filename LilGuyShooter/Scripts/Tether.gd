extends Node2D


# Properties
var pointA : CharacterBody2D
var pointB : CharacterBody2D
var ropeLength : float = 50.0
var slack : float = 15.0
var segments : int = 20

# Example: Set pointA and pointB references


func _ready():
	# Initialize the Line2D
	var line = Line2D.new()
	pointA = $"../SpaceMan"
	pointB = $"../Ship"
	add_child(line)

func _process(delta):
	# Update the positions of the points and the rope visual representation
	var segment_length = ropeLength / segments
	var rope_points = []
	
	# Calculate intermediate points based on segments
	for i in range(segments + 1):
		var t = i / float(segments)
		var point = lerp(pointA.position + Vector2(0,0), pointB.position+ Vector2(0,15), t)
		point.y += slack * (1.0 - t * t)  # Apply gravity-like slack
		rope_points.append(point)
	
	# Update Line2D
	var line = get_node("Line2D")
	line.points = rope_points

# Helper function to interpolate between two Vector2 points
func lerp(a, b, t):
	return a + (b - a) * t

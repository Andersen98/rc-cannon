shader_type canvas_item;
uniform float radius = 0.5;
uniform vec2 center = vec2(0.5,0.5);
void fragment() {
	// Place fragment code here.
	COLOR = vec4(0.0,0.0,0.0,0.0); //transparent
	if (( pow(UV.x-center.x,2) + pow(UV.y-center.y,2)) < pow(radius,2)){
		COLOR = vec4(0.4, 0.6, 0.9,1.0);
	}
	
}

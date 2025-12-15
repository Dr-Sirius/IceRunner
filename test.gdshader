shader_type spatial;

uniform vec4 color: source_color = vec4(1,1,1,1);

void vertex() {
	
}

void fragment() {
	EMISSION = color.xyz;
	EMISSION.p = 1.0;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}

shader_type spatial;
uniform float zcutoff;
uniform float uvscale;
uniform sampler2D color_gradient;
uniform float metal;
uniform float rough;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 modelspace = inverse(MODEL_MATRIX)*(INV_VIEW_MATRIX*vec4(VERTEX,1.0));
	ALBEDO = texture(color_gradient,vec2(modelspace.z,modelspace.z)*uvscale+vec2(zcutoff)).rgb;
	METALLIC = metal;
	ROUGHNESS = rough;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}

shader_type spatial;
render_mode unshaded;
uniform sampler2D noise:filter_nearest_mipmap_anisotropic;
uniform sampler2D waves;
uniform float cutoff;
uniform vec3 color:source_color;
uniform float uvscale;
uniform float waveuvscale;
float hash(vec2 key){
	   //float temp = dot(key,vec2(PI*PI,TAU*TAU));
	return fract(fract(key.x/key.y * PI*8.65985457+84.0/1.1565565656)*10.0);
}
void vertex() {
	// Called for every vertex the material is visible on.
}
void fragment() {
	vec4 worldspace = (INV_VIEW_MATRIX*vec4(VERTEX,1.0));
	vec4 localspace = inverse(MODEL_MATRIX)*worldspace;
	worldspace.xy += vec2(sin(TIME))*0.35*localspace.z;
	vec3 depth = texture(noise,worldspace.xz*uvscale).rgb;
	ALBEDO = color *texture(waves,(worldspace.xz*vec2(waveuvscale,0.05))+vec2(TIME/20.0,0.0)).rgb*((depth+1.0)/2.0);
	ALPHA = max(0.0,min(1.0,ceil(depth.x-(localspace.z+cutoff)*7.5)));
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}

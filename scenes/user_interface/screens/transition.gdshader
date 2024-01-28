shader_type canvas_item;

uniform sampler2D noise_texture;
uniform sampler2D dissolve_noise_texture;
uniform vec4 col_1 : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 col_2 : source_color = vec4(34.0, 32.0, 12.0, 1.0);
uniform float tiling_factor : hint_range(1.0, 10.0) = 1.0;
uniform float move_speed : hint_range(0.1, 5.0) = 0.1;
uniform float substract_speed : hint_range(0.1, 5.0) = 1.0;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV * tiling_factor;
	
	uv.y += TIME * -move_speed;
	
	uv = fract(uv);
	
	float noise_value = texture(noise_texture, uv).r;
	float dissolve_value = texture(dissolve_noise_texture, uv).r;
	float substract_factor = sin(TIME * substract_speed);
	float final_value = noise_value - (dissolve_value * substract_factor);
	
	vec4 final_color = mix(col_1, col_2, final_value);
	
	COLOR = final_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

shader_type spatial;

uniform sampler2D tile_noise;
uniform vec2 tiling;

void fragment()
{
	vec4 tile = step(0.11, texture(tile_noise, tiling*UV));
	vec3 color = vec3(tile.x, tile.y, tile.z);
	ALBEDO = color;
	NORMAL = normalize();
}


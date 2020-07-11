/// @func bbmod_material_on_apply_default(material)
/// @desc The default material application function.
/// @param {array} material The Material struct.
var _material = argument0;
var _shader = _material[BBMOD_EMaterial.Shader];

texture_set_stage(shader_get_sampler_index(_shader, "u_texNormalRoughness"),
	_material[BBMOD_EMaterial.NormalRoughness]);

texture_set_stage(shader_get_sampler_index(_shader, "u_texMetallicAO"),
	_material[BBMOD_EMaterial.MetallicAO]);

texture_set_stage(shader_get_sampler_index(_shader, "u_texSubsurface"),
	_material[BBMOD_EMaterial.Subsurface]);

texture_set_stage(shader_get_sampler_index(_shader, "u_texEmissive"),
	_material[BBMOD_EMaterial.Emissive]);

var _ibl = global.__bbmod_ibl_sprite;

if (_ibl != noone)
{
	_bbmod_shader_set_ibl(_shader, _ibl, global.__bbmod_ibl_subimage);
}

texture_set_stage(shader_get_sampler_index(_shader, "u_texBRDF"),
	sprite_get_texture(BBMOD_SprEnvBRDF, 0));

shader_set_uniform_f_array(shader_get_uniform(_shader, "u_vCamPos"),
	global.bbmod_camera_position);

shader_set_uniform_f(shader_get_uniform(_shader, "u_fExposure"),
	global.bbmod_camera_exposure);
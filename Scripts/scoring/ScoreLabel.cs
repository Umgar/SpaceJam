using Godot;
using System;

public partial class ScoreLabel : Label
{
	private float _score = 0;

	public Player player;
 
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		player = GetNode<Player>("../character_body_2d");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		if(player != null) {
			_score = player.Speed;
			Text = $"Score: {_score}";
		}
	}

}

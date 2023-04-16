using Godot;
using System;

public partial class Player : CharacterBody2D
{

	[Export]
	public float Speed = 700; // How fast the player will move (pixels/sec).

	public float ReverseSpeed = 200;
	AnimatedSprite2D animatedSprite2D;

	public Vector2 ScreenSize; // Size of the game window.


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		ScreenSize = GetViewportRect().Size;
		animatedSprite2D = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Speed += 1f * (float)delta;
		var velocity = Vector2.Zero; // The player's movement vector.
		ReverseSpeed = Speed / 2;

		if(Input.IsActionPressed("move_right"))
			velocity.X += 1;
		if(Input.IsActionPressed("move_left"))
			velocity.X -= 1;
		if(Input.IsActionPressed("move_up"))
			velocity.Y -= 1;
		if(Input.IsActionPressed("move_down"))
			velocity.Y += 1;



		if (velocity.Length() > 0)
		{
			velocity = velocity.Normalized() * Speed;
			animatedSprite2D.Play();
		}
		else
		{
			animatedSprite2D.Stop();
		}

		MoveAndCollide(velocity * (float)delta);
		Position = new Vector2(
		x: Mathf.Clamp(Position.X, -(ScreenSize.X/2), ScreenSize.X/2),
		y: Mathf.Clamp(Position.Y, -(ScreenSize.Y/6), (ScreenSize.Y/6))
		);
	
	}
	
}

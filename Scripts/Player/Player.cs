using Godot;
using System;

public partial class Player : CharacterBody2D
{

	[Export]
	public float Speed = 400; // How fast the player will move (pixels/sec).

	public float ReverseSpeed = 200;

	[Export]
	public Vector2 StartPoint = new Vector2(250,250); // Player's starting position

	public Vector2 ScreenSize; // Size of the game window.


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		ScreenSize = GetViewportRect().Size;
		//Position = StartPoint;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Speed += 0.01f;
		var velocity = Vector2.Zero; // The player's movement vector.
		velocity.Y -= 1; // The player's default velocity
		ReverseSpeed = Speed / 2;

		if(Input.IsActionPressed("move_right"))
			velocity.X += 1;
		if(Input.IsActionPressed("move_left"))
			velocity.X -= 1;
		if(Input.IsActionPressed("move_up"))
			velocity.Y -= 1;
		if(Input.IsActionPressed("move_down"))
			velocity.Y += 1;

		var animatedSprite2D = GetNode<AnimatedSprite2D>("AnimatedSprite2D");

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
		y: Position.Y
		);
	
	}
}

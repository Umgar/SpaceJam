using Godot;
using System;

public partial class Player : Area2D
{

	[Export]
    public int Speed = 400; // How fast the player will move (pixels/sec).

	[Export]
	public int ReverseSpeed = 200;

	[Export]
	public Vector2 StartPoint = new Vector2(250,250); // Player's starting position

    public Vector2 ScreenSize; // Size of the game window.


	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		ScreenSize = GetViewportRect().Size;
		Position = StartPoint;
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{

		var velocity = Vector2.Zero; // The player's movement vector.
		velocity.Y -= 1; // The player's default velocity
		Speed = ReverseSpeed * 2;

		if (Input.IsActionPressed("move_right"))
		{
			velocity.X += 1;
			Rotate(5f);
		}

		if (Input.IsActionPressed("move_left"))
		{
			velocity.X -= 1;
		}

		if (Input.IsActionPressed("brake"))
		{
			velocity.Y += 1;

			if(velocity.Length() == 0) { 
				velocity.Y += 1;
				Speed = ReverseSpeed;  // próbuje tu zrobić coś ala cofanie xddd
			} 

		}

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

		Position += velocity * (float)delta;
		Position = new Vector2(
			x: Mathf.Clamp(Position.X, 0, ScreenSize.X),
			y: Mathf.Clamp(Position.Y, 0, ScreenSize.Y)
		);


	}
}

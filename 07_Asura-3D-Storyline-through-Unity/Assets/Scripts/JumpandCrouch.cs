using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JumpandCrouch : MonoBehaviour
{
    private PlayerMovement playerMovement;
    public float sprint_speed = 10f;
    public float move_speed = 5f;
    public float crouch_speed = 2f;
    private Transform look_root;
    private float stand_height = 1.6f;
    private float crouch_height = 1f;
    private bool is_crouching;
    private PlayerFootsteps player_footstep;
    private float sprint_volume = 1f;
    private float crouch_volume = 0.1f;
    private float walk_Volume_Min = 0.2f, walk_Volume_Max = 0.6f;
    private float walk_step_Distance = 0.4f;
    private float sprint_step_Distance = 0.25f;
    private float crouch_step_Distance = 0.5f;

    // Start is called before the first frame update
    void Awake()
    {
        playerMovement = GetComponent<PlayerMovement>();
        look_root = transform.GetChild(0);
        player_footstep = GetComponentInChildren<PlayerFootsteps>();
    }

    void Start()
    {
        player_footstep.volume_Min = walk_Volume_Min;
        player_footstep.volume_Max = walk_Volume_Max;
        player_footstep.step_Distance = walk_step_Distance;
    }
    // Update is called once per frame
    void Update()
    {
        Sprint();
        Crouch();
    }
    void Sprint()
    {
        if (Input.GetKeyDown(KeyCode.LeftShift) && !is_crouching)
        {
            playerMovement.speed = sprint_speed;
            player_footstep.step_Distance = sprint_step_Distance;
            player_footstep.volume_Min = sprint_volume;
            player_footstep.volume_Max = sprint_volume;
        }
        if (Input.GetKeyUp(KeyCode.LeftShift) && !is_crouching)
        {
            playerMovement.speed = move_speed;
            playerMovement.speed = sprint_speed;
            player_footstep.step_Distance = walk_step_Distance;
            player_footstep.volume_Min = walk_Volume_Min;
            player_footstep.volume_Max = walk_Volume_Max;
        }
    }
    void Crouch()
    {
        if (Input.GetKeyDown(KeyCode.C)){
            if (is_crouching)
            {
                look_root.localPosition = new Vector3(0f, stand_height, 0f);
                playerMovement.speed = move_speed;
                player_footstep.step_Distance = walk_step_Distance;
                player_footstep.volume_Min = walk_Volume_Min;
                player_footstep.volume_Max = walk_Volume_Max;
                is_crouching = false;
            }
            else
            {
                look_root.localPosition = new Vector3(0f, crouch_height, 0f);
                playerMovement.speed = crouch_speed;
                player_footstep.step_Distance = crouch_step_Distance;
                player_footstep.volume_Min = crouch_volume;
                player_footstep.volume_Max = crouch_volume;
                is_crouching = true;
            }
        }
    }
        
}

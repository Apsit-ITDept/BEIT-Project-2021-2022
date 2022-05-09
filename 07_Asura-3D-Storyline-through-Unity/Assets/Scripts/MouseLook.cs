using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MouseLook : MonoBehaviour
{
    [SerializeField]
    private Transform playerRoot, lookRoot;

    [SerializeField]
    private bool invert;

    [SerializeField]
    private bool can_Unlock = true;

    [SerializeField]
    private float sensitivity = 5f;

    [SerializeField]
    private int smooth_steps = 10;

    [SerializeField]
    private float smooth_Weight = 0.4f;

    [SerializeField]
    private float roll_Angle = 10f;

    [SerializeField]
    private float roll_speed = 3f;

    [SerializeField]
    private Vector2 default_look_limits = new Vector2(-70f, 80f);

    private Vector2 look_angles;
    private Vector2 current_Mouse_Look;
    private Vector2 smooth_Move;
    private float current_Roll_Angles;
    private int last_look_Frame;
    // Start is called before the first frame update
    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        LockandUnlockCursor();
        if(Cursor.lockState == CursorLockMode.Locked)
        {
            LookAround();
        }
            
    }
    void LockandUnlockCursor()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (Cursor.lockState == CursorLockMode.Locked)
            {
                Cursor.lockState = CursorLockMode.None;
            }
            else
            {
                Cursor.lockState = CursorLockMode.Locked;
                Cursor.visible = false;
            }
        }
    }
    void LookAround()
    {
        current_Mouse_Look = new Vector2(Input.GetAxis("Mouse Y"), Input.GetAxis("Mouse X"));

        look_angles.x += current_Mouse_Look.x * sensitivity * (invert ? 1f : -1f);
        look_angles.y += current_Mouse_Look.y * sensitivity;
        look_angles.x = Mathf.Clamp(look_angles.x, default_look_limits.x, default_look_limits.y);
        current_Roll_Angles = Mathf.Lerp(current_Roll_Angles, Input.GetAxisRaw("Mouse X") * roll_Angle, Time.deltaTime * roll_speed);
        lookRoot.localRotation=Quaternion.Euler(look_angles.x, 0f, current_Roll_Angles);
        playerRoot.localRotation = Quaternion.Euler(0f, look_angles.y, 0f);
    }
}

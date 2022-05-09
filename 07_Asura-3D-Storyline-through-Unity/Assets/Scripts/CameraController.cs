using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public Transform target;
    public Vector3 offset;
    public float zoomSpeed = 4f;
    public float minZoom = 5f;

    public float yawSpeed = 100f;
    public float maxZoom = 15f;
    public float pitch = 2f;
    private float currentZone = 10f;
    private float currentYaw = 0f;
    // Start is called before the first frame update

    private void Update()
    {
        currentZone -= Input.GetAxis("Mouse ScrollWheel") * zoomSpeed;
        currentZone = Mathf.Clamp(currentZone, minZoom, maxZoom);
        currentYaw -=Input.GetAxis("Horizontal") * yawSpeed * Time.deltaTime;
    }
    void LateUpdate()
    {
        transform.position = target.position - offset * currentZone;
        transform.LookAt(target.position + Vector3.up * pitch);
        transform.RotateAround(target.position, Vector3.up, currentYaw);
    }


}

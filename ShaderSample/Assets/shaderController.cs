using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class shaderController : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        GetComponent<Renderer>().material.SetColor("_BaseColor",Color.red);
    }

}

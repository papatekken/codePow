package com.ay.codepow;


import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
public class CodePowController {
    @GetMapping("/greeting")
    public ResponseEntity<String> greeting(){
        return ResponseEntity.ok("hello world");
    }
}


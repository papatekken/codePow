package com.ay.codepow;


import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Validated
public class CodePowController {
    @GetMapping("/training")
    public ResponseEntity<String> training(){
        return ResponseEntity.ok("training done");
    }

    @GetMapping("/eating")
    public ResponseEntity<String> eating(){
        return ResponseEntity.ok("eating done");
    }

    @GetMapping("/resting")
    public ResponseEntity<String> resting(){
        return ResponseEntity.ok("resting done");
    }
}


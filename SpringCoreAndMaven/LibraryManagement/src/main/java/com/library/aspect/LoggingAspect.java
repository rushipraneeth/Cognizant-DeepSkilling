package com.library.aspect;

public class LoggingAspect {

    public void beforeAdvice() {
        System.out.println("Before Method Execution...");
    }

    public void afterAdvice() {
        System.out.println("After Method Execution...");
    }
}
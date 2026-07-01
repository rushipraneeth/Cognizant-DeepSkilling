package com.junit.exercise1;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class MainTest {

    @Test
    public void testAddition() {
        assertEquals(5, 2 + 3);
    }
}
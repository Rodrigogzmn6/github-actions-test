package com.todocodeacademy.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(HolaController.class)
class HolaControllerTest {

    @Autowired
    private MockMvc mvc;

    @Test
    void deberiaResponderHolaMundo() throws Exception {
        mvc.perform(get("/hola"))
                .andExpect(status().isOk())
                .andExpect(content().string("Hola Mundo"));
    }

}

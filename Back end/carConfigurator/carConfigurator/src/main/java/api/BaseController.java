package api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.gson.Gson;

import jwt.JwtTokenUtil;
import api.DataAccessService;
import exception.APIRequestException;
import model.User;

public class BaseController {

	DataAccessService dataAccessService;

	@Autowired
	private jwt.JwtTokenUtil jwtTokenUtil;

	@Autowired
	public BaseController() {

	}

	public BaseController(DataAccessService dataAccessService) {
		this.dataAccessService = dataAccessService;
	}

	public void verifyUserFromTokenAndIfLoggedIn(String authorization, String username) {
		String jwtToken = null;
		String usernameToken = null;

		if (authorization.startsWith("Bearer ")) {
			jwtToken = authorization.substring(7);
			usernameToken = jwtTokenUtil.getUsernameFromToken(jwtToken);
		}
		if (!username.equals(usernameToken)) {
			throw new APIRequestException(HttpStatus.BAD_REQUEST,
					"Username ul din token este diferit de cel din request");
		}

	}
}

package com.sp.common;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

@Service("myMath")
public class MyMath {
	public double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
		double R = 6371; // km
		double dLat = toRad(lat2 - lat1);
		double dLon = toRad(lon2 - lon1);
		double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)
				+ Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) * Math.sin(dLon / 2);
		double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
		double d = R * c;

		return d;
	}

	public double calculateDistance2(double lat, double lon, double lat2, double lon2) {
		double theta = lon - lon2;
		double dist = Math.sin(lat * Math.PI / 180.0) * Math.sin(lat2 * Math.PI / 180.0)
				+ Math.cos(lat * Math.PI / 180.0) * Math.cos(lat2 * Math.PI / 180.0)
						* Math.cos(theta * Math.PI / 180.0);

		dist = Math.acos(dist);

		dist = dist * 180 / Math.PI;
		dist = dist * 60 * 1.1515;
		dist = dist * 1.609344; // kilometer

		return dist;
	}

	public double toRad(double dist) {
		return dist * Math.PI / 180;
	}

	public JSONObject getCookie(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException  {
		Cookie[] cc = req.getCookies();
		JSONObject job=new JSONObject();
		
		if (cc != null) {
			for (Cookie c : cc) {
				String name = c.getName();
				String value = c.getValue();

				if (name.equals("cur_Loc")) {
					value = URLDecoder.decode(value, "UTF-8");
				}
				job.put(name, value);
			}
		}
	    return job;
	}
}

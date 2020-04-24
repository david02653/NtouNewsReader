package ntou.cs.model;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

public class NewsRetrievalUsingAPI {

	public static final String apiUrl = "https://newsapi.org/v2/top-headlines?country=tw";
	//public static final String apiKey = "Your API Key";
	public static final String apiKey = "d5e1134287784664b60d2e70ae6ea18e";

	public static final int SPORTS = 1;
	public static final int BUSINESS = 2;
	public static final int HEALTH = 3;
	public static final int ENTERTAINMENT = 4;

	public static ArrayList<News> getNews(int type) throws IOException {
		String category = "sports";

		switch (type) {
		case 1:
			category = "sports";
			break;
		case 2:
			category = "business";
			break;
		case 3:
			category = "health";
			break;
		case 4:
			category = "entertainment";
			break;
		}

		ArrayList<News> newsList = new ArrayList<News>();

		String url = apiUrl + "&category=" + category + "&apiKey=" + apiKey;
		System.out.println("Fetch URL: " + url);

		String response = getResponse(url);

		Gson gson = new Gson();

		JsonArray newsArray = gson.fromJson(response, JsonObject.class).get("articles").getAsJsonArray();

		for (Iterator<JsonElement> iterator = newsArray.iterator(); iterator.hasNext();) {
			JsonObject article = iterator.next().getAsJsonObject();
			article.remove("source");

			String fragment = article.toString();
			News news = gson.fromJson(fragment, News.class);

			newsList.add(news);

			// System.out.println(news);
		}

		return newsList;
	}

	public static String getResponse(String url) throws IOException {
		URL urlObject = new URL(url);
		HttpURLConnection con = (HttpURLConnection) urlObject.openConnection();
		con.setRequestMethod("GET");

		con.setConnectTimeout(5000);
		con.setReadTimeout(5000);

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		String inputLine;
		StringBuffer content = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			content.append(inputLine);
		}

		in.close();
		con.disconnect();

		return content.toString();
	}

	public static void main(String args[]) {
		try {
			ArrayList<News> newsList = getNews(NewsRetrievalUsingAPI.SPORTS);
			System.out.println("News List:\n" + newsList);
		} catch (IOException e) {
			System.err.println(e);
		}
	}
}
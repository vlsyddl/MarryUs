package kr.co.marryus.repository.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

public class Todolist2 {
	/*private String title;
	private String id;
	private String defaultStyle;
	private List<Map<String, Object>> items;
	
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getDefaultStyle() {
		return defaultStyle;
	}


	public void setDefaultStyle(String defaultStyle) {
		this.defaultStyle = defaultStyle;
	}


	public List<Map<String, Object>> getItems() {
		return items;
	}


	public void setItems(List<Map<String, Object>> items) {
		this.items = items;
	}


	public static void main(String[] args) {
		// DB 데이터
		List<Item> list = makeList();
//		System.out.println(makeList());
		
		// 화면에 보내줄 데이터 조작..
		
		List<Todolist2> result = new ArrayList<>();
		
		
		Todolist2 todo = null;
		int prevPeriod = 0;
		List<Map<String, Object>> items = new ArrayList<>();
		for (Item item : list) {
			if (item.getTodoPeriod() != prevPeriod) {
				todo = new Todolist2();

				items = new ArrayList<>();
				todo.setItems(items);
				todo.setDefaultStyle("lobilist-info");
				todo.setTitle("1달전...");

				prevPeriod = item.getTodoPeriod();
				
				result.add(todo);
			}
			Map<String, Object> itemMap = new HashMap<>();
			itemMap.put("description", item.getTodoDetail());
			itemMap.put("title", item.getTodoTitle());
			itemMap.put("dueDate", item.getTodoDay());
			items.add(itemMap);
			
		}
		
		Map<String, List<Todolist2>> jsonMap = new HashMap<>();
		jsonMap.put("lists", result);
		System.out.println(new Gson().toJson(jsonMap));
	}


	private static List<Item> makeList() {
		// 데이터베이스 접근 데이터 조회
		List<Item> list = new ArrayList<>();
		for (int i = 0; i < 6; i++) {
			Item item = new Item();
			item.setTodoPeriod(i < 2 ? 1 : i < 4 ? 2 : 3);
			item.setTodoTitle("테스트" + i);
			list.add(item);
		}
		return list;
	}


	@Override
	public String toString() {
		return "Todolist [title=" + title + ", id=" + id + ", defaultStyle=" + defaultStyle + ", items=" + items + "]";
	}*/
	
	
}




/*






[
	{
		"title":"1달전...",
		"defaultStyle":"lobilist-info",
		"items":[
					{"title":"테스트0"},
					{"title":"테스트1"}
				]
	},
	{
		"title":"1달전...",
		"defaultStyle":"lobilist-info",
		"items":[
					{"title":"테스트2"},
					{"title":"테스트3"}
				]
	},
	{
		"title":"1달전...",
		"defaultStyle":"lobilist-info",
		"items":[
					{"title":"테스트4"},
					{"title":"테스트5"}
				]
	}
]




*/
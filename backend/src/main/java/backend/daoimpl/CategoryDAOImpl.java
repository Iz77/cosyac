package backend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import backend.dao.CategoryDAO;
import backend.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	private static List<Category> categories = new ArrayList<>();
	
	static {
		
		Category category = new Category();
		
		//adding first category
		category.setId(1);
		category.setName("Window");
		category.setDescription("Description for Window AC");
		category.setImageURL("CAT_1.png");
		
		categories.add(category);
		
		//second category
		category = new Category();
		category.setId(2);
		category.setName("Central");
		category.setDescription("Description for Central AC");
		category.setImageURL("CAT_2.png");
		
		categories.add(category);
		
		//third category
		category = new Category();
		category.setId(3);
		category.setName("Split");
		category.setDescription("Description for Split AC");
		category.setImageURL("CAT_3.png");
		
		categories.add(category);
		
		
	}
	

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return categories;
	}

}

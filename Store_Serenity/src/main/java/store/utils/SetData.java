package store.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import io.cucumber.datatable.DataTable;
import store.models.ItemsData;
import store.models.UserData;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SetData {

    public List<ItemsData> setItemsData(DataTable dataTable) {
        List<ItemsData> data = new ArrayList<>();
        List<Map<String, String>> mapInfo = dataTable.asMaps();
        for (Map<String, String> map : mapInfo) {
            data.add(new ObjectMapper().convertValue(map, ItemsData.class));
        }
        return data;
    }

    public List<UserData> setUserData(DataTable dataTable) {
        List<UserData> data = new ArrayList<>();
        List<Map<String, String>> mapInfo = dataTable.asMaps();
        for (Map<String, String> map : mapInfo) {
            data.add(new ObjectMapper().convertValue(map, UserData.class));
        }
        return data;
    }

}

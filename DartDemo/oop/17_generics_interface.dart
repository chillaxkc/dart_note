
abstract class ObjectCache{
  getBykey(String key);

  void setByKey(String key,Object value);
}

abstract class StringCache{
  getBykey(String key);

  void setByKey(String key,Object value);
}

// 泛型接口
abstract class Cache<T>{
  getBykey(String key);

  void setByKey(String key,T value);
}

// 文件缓存
class FileCache<T> implements Cache<T>{
  @override
  getBykey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print("file cache key=${key} value=${value}");
  }
}

// 内存缓存
class MemoryCache<T> implements Cache<T>{
  @override
  getBykey(String key) {
    return null;
  }

  @override
  void setByKey(String key, T value) {
    print("Memory cache key=${key} value=${value}");
  }
}
void main(){
  // FileCache fc = new FileCache<String>();
  // fc.setByKey("foo", "bar");
  // fc.setByKey("foo", 2); // 报错，因为已经约定了字符串

  FileCache fc = new FileCache<Map>();
  fc.setByKey("foo", {"name":"张三丰","age":218});

}
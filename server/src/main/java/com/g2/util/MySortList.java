package com.g2.util;

import java.util.*;
import java.lang.reflect.Method;
import java.lang.reflect.InvocationTargetException;

/**
 * 这是一个自定义排序的类，专门针对列表（List）中的数据进行排序；可按指定方法进行。
 * 目前实现对整型（Integer）进行排序。
 * @author acer
 *
 * @param <E>
 */
public class MySortList<E> {
    
    /**
     * 对列表中的数据按指定字段进行排序。要求类必须有相关的方法返回。
     * @param list
     * @param method
     * @param reverseFlag
     */
    public void sortByMethod(List<E> list, final String method,
            final boolean reverseFlag) {
        Collections.sort(list, new Comparator<Object>() {
            @SuppressWarnings("unchecked")
            public int compare(Object arg1, Object arg2) {
                int result = 0;
                try {
                    Method m1 = ((E) arg1).getClass().getMethod(method, null);
                    Method m2 = ((E) arg2).getClass().getMethod(method, null);
                    Object obj1 = m1.invoke(((E)arg1), null);
                    Object obj2 = m2.invoke(((E)arg2), null);
                    
                    result = Integer.valueOf(obj1.toString()) - Integer.valueOf(obj2.toString());
                    
                    if (reverseFlag) {
                        // 倒序
                        result = -result;
                    }
                } catch (NoSuchMethodException nsme) {
                    nsme.printStackTrace();
                } catch (IllegalAccessException iae) {
                    iae.printStackTrace();
                } catch (InvocationTargetException ite) {
                    ite.printStackTrace();
                }

                return result;
            }
        });
    }
}

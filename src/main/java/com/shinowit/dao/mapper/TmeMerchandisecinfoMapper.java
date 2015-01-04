package com.shinowit.dao.mapper;

import com.shinowit.entity.TmeMerchandisecinfo;
import com.shinowit.entity.TmeMerchandisecinfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TmeMerchandisecinfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int countByExample(TmeMerchandisecinfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int deleteByExample(TmeMerchandisecinfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int deleteByPrimaryKey(String merchandisecid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int insert(TmeMerchandisecinfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int insertSelective(TmeMerchandisecinfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    List<TmeMerchandisecinfo> selectByExample(TmeMerchandisecinfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    TmeMerchandisecinfo selectByPrimaryKey(String merchandisecid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int updateByExampleSelective(@Param("record") TmeMerchandisecinfo record, @Param("example") TmeMerchandisecinfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int updateByExample(@Param("record") TmeMerchandisecinfo record, @Param("example") TmeMerchandisecinfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int updateByPrimaryKeySelective(TmeMerchandisecinfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table TMe_MerchandiseCInfo
     *
     * @mbggenerated Wed Dec 31 15:42:28 CST 2014
     */
    int updateByPrimaryKey(TmeMerchandisecinfo record);

    List<TmeMerchandisecinfo> selectPage(TmeMerchandisecinfoExample example);

    String selectMaxPrimaryKeyValue();
}
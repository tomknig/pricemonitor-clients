/**
 * Pricemonitor API
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: 0.0.5000
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */
import { GetPriceRecommendationApiResponseTags } from './getPriceRecommendationApiResponseTags';


export interface GetPriceRecommendationApiResponseData { 
    tags?: Array<GetPriceRecommendationApiResponseTags>;
    currency?: string;
    customerProductId?: string;
    deliveryCosts?: number;
    gtin?: object;
    oldDeliveryCosts?: number;
    oldPrice?: number;
    price?: number;
    productId?: string;
    relativePriceChangePercentage?: number;
    timestamp?: string;
}


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
import { AndFilter } from './andFilter';
import { ComparisonFilter } from './comparisonFilter';
import { ConstantFilter } from './constantFilter';
import { OrFilter } from './orFilter';


export interface NotFilter { 
    filter: OrFilter | AndFilter | NotFilter | ConstantFilter | ComparisonFilter;
    type: NotFilter.TypeEnum;
}
export namespace NotFilter {
    export type TypeEnum = 'NotFilter';
    export const TypeEnum = {
        NotFilter: 'NotFilter' as TypeEnum
    };
}


